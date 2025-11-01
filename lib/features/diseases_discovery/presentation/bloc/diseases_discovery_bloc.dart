import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../../../app/api/api_failure_handler.dart';
import '../../../../app/app_snack_bar.dart';
import '../../../../core/strings/constant.dart';
import '../../domain/usecases/send_for_diagnosis_usecase.dart';
import '../functions/change_list.dart';
import '../functions/convert_text_to_symptoms.dart';
import '../functions/remove_duplicate_words.dart';
part 'diseases_discovery_event.dart';
part 'diseases_discovery_state.dart';

class DiseasesDiscoveryBloc
    extends Bloc<DiseasesDiscoveryEvent, DiseasesDiscoveryState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  final FlutterTts flutterTts = FlutterTts();
  final SendForDiagnosisUsecase sendForDiagnosis;
  DiseasesDiscoveryBloc(this.sendForDiagnosis)
      : super(DiseasesDiscoveryState()) {
    //1
    on<ToggleListeningEvent>((event, emit) async {
      String languageCode =
          EasyLocalization.of(event.context)!.locale.languageCode == 'en'
              ? 'en'
              : 'ar';
      if (!state.isListening) {
        bool available = await _speech.initialize();
        if (available) {
          emit(state.copyWith(isListening: true));
          _speech.listen(
              onResult: (result) {
                add(UpdateRecognizedTextEvent(result.recognizedWords));
              },
              //localeId: 'ar_EG');
              localeId: languageCode);
        }
      } else {
        emit(state.copyWith(isListening: false));
        _speech.stop();
      }
    });
    // 2
    on<UpdateRecognizedTextEvent>((event, emit) async {
      String newText = removeDuplicateWords(event.newText);
      String updatedText = "${state.recognizedText} $newText";
      emit(state.copyWith(recognizedText: updatedText));
      String symptom = SymptomMapper.convertTextToSymptom(newText);
      if (symptom.isNotEmpty && !state.selectedSymptoms.contains(symptom)) {
        List<String> selectedSymptoms = List.from(state.selectedSymptoms)
          ..add(symptom);
        emit(state.copyWith(selectedSymptoms: selectedSymptoms));
        add(SearchSymptoms(''));
        print("Added symptom: $symptom");
      }
    });
    //3
    on<ClearRecognizedTextEvent>((event, emit) async {
      emit(state.copyWith(recognizedText: ""));
    });
    //4
    on<SendForDiagnosisEvent>((event, emit) async {
      ChangeList changeList = ChangeList(state.selectedSymptoms);
      Map<String, String> symptomsData = changeList.getUpdatedList();
      final result = await sendForDiagnosis(symptomsData);
      result.fold((failure) {
        ApiFailureHandler.handleFailure(
            context: event.context,
            failure: failure,
            retryAction: () =>
                add(SendForDiagnosisEvent(context: event.context)));
      }, (right) {
        if (right.confidence > 59) {
          emit(state.copyWith(isDiagnosisButtonPressed: true));
        }
        emit(
            state.copyWith(diagnosis: right.diagnosis, advices: right.advices));
      });
    });
    //

    on<SearchSymptoms>((event, emit) async {
      List<String> results = allSymptoms.where((symptom) {
        return symptom.toLowerCase().tr().contains(event.query.toLowerCase());
      }).toList();
      results.sort((a, b) {
        bool aSelected = state.selectedSymptoms.contains(a);
        bool bSelected = state.selectedSymptoms.contains(b);
        if (aSelected && !bSelected) return -1;
        if (!aSelected && bSelected) return 1;
        return 0;
      });

      emit(state.copyWith(filteredSymptoms: results));
    });
    on<ToggleSymptomSelection>((event, emit) async {
      List<String> updatedSelectedSymptoms = List.from(state.selectedSymptoms);
      if (updatedSelectedSymptoms.contains(event.symptom)) {
        updatedSelectedSymptoms.remove(event.symptom);
      } else {
        updatedSelectedSymptoms.add(event.symptom);
      }
      add(SearchSymptoms(''));
      emit(state.copyWith(selectedSymptoms: updatedSelectedSymptoms));
    });
    //
    on<ResetValuesEvent>((event, emit) async {
      emit(state.copyWith(selectedSymptoms: [], diagnosis: "", advices: []));
    });
    //
    on<StopDiagnosisSpokenEvent>((event, emit) async {
      emit(state.copyWith(isDiagnosisSpoken: false));
    });
    on<ChangeLanguageEvent>((event, emit) {
      Locale newLocale =
          EasyLocalization.of(event.context)!.locale.languageCode == 'en'
              ? const Locale('ar')
              : const Locale('en');
      event.context.setLocale(newLocale);
      emit(state.copyWith(locale: newLocale));
    });
//
    on<ToggleSpeechEvent>((event, emit) async {
      if (state.isSpeaking) {
        await flutterTts.stop();
        emit(state.copyWith(isSpeaking: false, isDiagnosisSpoken: false));
      } else {
        String combinedText = '';
        if (state.diagnosis.isNotEmpty) {
          combinedText += '${'Diagnosis'.tr()}: ${state.diagnosis.tr()}. ';
        }
        if (state.advices.isNotEmpty) {
          final advText = state.advices.map((a) => a.tr()).join('. ');
          combinedText += '${'Advices'.tr()}: $advText.';
        }
        await flutterTts.setLanguage(event.context.locale.languageCode);
        await flutterTts.speak(combinedText);
        emit(state.copyWith(isSpeaking: true, isDiagnosisSpoken: true));
      }
    });
    //
    on<StopSpeechEvent>((event, emit) async {
      await flutterTts.stop();
      emit(state.copyWith(isSpeaking: false));
    });
  }
}



      // final url = Uri.parse('http://192.168.1.130:5000/predict');
      // ChangeList changeList = ChangeList(state.selectedSymptoms);
      // Map<String, String> symptomsData = changeList.getUpdatedList();
      // try {
      //   final response = await http
      //       .post(url,
      //           headers: {'Content-Type': 'application/json'},
      //           body: jsonEncode(symptomsData))
      //       .timeout(const Duration(seconds: 2));
      //   if (response.statusCode == 200) {
      //     String disease;
      //     List<String> adviceList;
      //     Map<String, dynamic> data = json.decode(response.body);
      //     double confidence =
      //         double.tryParse(data["confidence"].toString()) ?? 0.0;
      //     if (confidence > 59) {
      //       disease = data["disease"];
      //       adviceList = List<String>.from(data["advice"]);
      //       emit(state.copyWith(
      //           diagnosis: disease,
      //           advices: adviceList,
      //           isDiagnosisButtonPressed: true));
      //     } else {
      //       disease = "No diagnosis".tr();
      //       adviceList = ["Please consult a doctor".tr()];
      //       emit(state.copyWith(diagnosis: disease, advices: adviceList));
      //     }
      //   } else {
      //     print("خطأ في الطلب: ${response.statusCode}");
      //     AppSnackBar.show(event.context, "An unexpected error occurred".tr());
      //   }
      // } on TimeoutException catch (_) {
      //   print("الطلب استغرق وقتًا طويلاً ولم يتم استلام استجابة.");
      //   AppSnackBar.show(event.context, "Please re-order".tr());
      // }