import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:disease_discovery_project/app/app_appBar.dart';
import 'package:disease_discovery_project/app/enum_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;

import '../../app/app_snack_bar.dart';
import '../../app/constant.dart';
import '../functions/change_list.dart';
import '../functions/convert_text_to_symptoms.dart';
import '../functions/extract_symptoms.dart';
import '../functions/remove_duplicate_words.dart';

part 'diseases_discovery_event.dart';
part 'diseases_discovery_state.dart';

class DiseasesDiscoveryBloc
    extends Bloc<DiseasesDiscoveryEvent, DiseasesDiscoveryState> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  DiseasesDiscoveryBloc() : super(DiseasesDiscoveryState()) {
    // DiseasesDiscoveryBloc()
    // هذا هو المُنشئ للكلاس DiseasesDiscoveryBloc. يتم استدعاؤه عند إنشاء كائن من هذا الكلاس.
    // : super(DiseasesDiscoveryState())
    //يُخبر Bloc بأن الحالة الافتراضية عند بدء التطبيق هي DiseasesDiscoveryState().

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
      // String updatedText =
      //     removeDuplicateWords("${state.recognizedText} ${event.newText}");
      // print(updatedText);
      //   emit(state.copyWith(recognizedText: updatedText));
      print(event.newText);
      print("event.newText -----------------------------------");
      String newText = removeDuplicateWords(event.newText);
      String updatedText = "${state.recognizedText} $newText";
      emit(state.copyWith(recognizedText: updatedText));
      String symptom = SymptomMapper.convertTextToSymptom(event.newText);
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
      final url = Uri.parse('http://192.168.1.130:5000/predict');
      //final url = Uri.parse('http://192.168.215.129:5000/predict');

      //  if (event.method == DiagnosticMethod.fromMic) {
      //    symptomsData = extractSymptoms(state.recognizedText);
      // } else {
      // state.selectedSymptoms = ['skin_rash', 'chills'];

      ChangeList changeList = ChangeList(state.selectedSymptoms);

      Map<String, String> symptomsData = changeList.getUpdatedList();

      print(state.selectedSymptoms);
      print("state.selectedSymptoms -------------------");
      print(symptomsData);
      print("symptomsData -------------------");

      // symptomsData={
      //   'skin_rash':"1",
      //   'chills': "1"
      // }
      //   }

      try {
        final response = await http
            .post(url,
                headers: {'Content-Type': 'application/json'},
                body: jsonEncode(symptomsData))
            .timeout(const Duration(seconds: 2));

        //symptomsData="{'skin_rash':"1",'chills': "1"}"

        // تحديد مهلة 10 ثوانٍ
        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);
          print(data);
          print("data -------------------------");
          String disease = data["disease"];
          List<String> adviceList = List<String>.from(data["advice"]);
          print(disease);
          print("disease -------------------");
          print(adviceList);
          print("adviceList -------------------");
          emit(state.copyWith(diagnosis: disease, advices: adviceList));
        } else {
          print("خطأ في الطلب: ${response.statusCode}");
          AppSnackBar.show(event.context, "An unexpected error occurred".tr());
          // emit(state.copyWith(diagnosis: "حدث خطأ أثناء التشخيص", advices: []));
        }
      } on TimeoutException catch (_) {
        print("الطلب استغرق وقتًا طويلاً ولم يتم استلام استجابة.");
        AppSnackBar.show(event.context, "Please re-order".tr());

        // emit(state.copyWith(
        //     diagnosis: "انتهت مهلة الاستجابة، حاول مرة أخرى.", advices: []));
      }
    });
    //

    on<SearchSymptoms>((event, emit) async {
      //event.query البحث في القائمة الاساسية للاعراض عن كل الاعراض التي تحتوي على القيمة المدخلة في حقل البحث وهو
      List<String> results = allSymptoms.where((symptom) {
        return symptom.toLowerCase().tr().contains(event.query.toLowerCase());
      }).toList();
      //  results = ['extra', 'buring', 'received', "abc"];
      // ترتيب القائمة بحيث تكون الأعراض المختارة في الأعلى

      //selectedSymptoms= ['nodal_skin', 'internal_itching','extra']

      results.sort((a, b) {
        bool aSelected = state.selectedSymptoms.contains(a);
        bool bSelected = state.selectedSymptoms.contains(b);
        if (aSelected && !bSelected) return -1;
        // إذا كان a موجودًا في القائمة المختارة (selectedSymptoms) ولم يكن b، يتم وضع a قبل b (return -1).
        if (!aSelected && bSelected) return 1;
        // إذا كان b موجودًا في القائمة المختارة (selectedSymptoms) ولم يكن a، يتم وضع b قبل a (return 1).
        return 0;
        // وإلا لايتم الترتيب
      });

      emit(state.copyWith(filteredSymptoms: results));
    });
//results= [ nodal_skin_eruptions,stomach_pain, continuous_sneezing, skin_rash,joint_pain , acidity]
    on<ToggleSymptomSelection>((event, emit) async {
      // state.selectedSymptoms = ['chills'];

      List<String> updatedSelectedSymptoms = List.from(state.selectedSymptoms);
      if (updatedSelectedSymptoms.contains(event.symptom)) {
        updatedSelectedSymptoms.remove(event.symptom);
      } else {
        updatedSelectedSymptoms.add(event.symptom);
      }

      // إعادة ترتيب القائمة بعد تحديث الاختيارات
      add(SearchSymptoms(''));
      emit(state.copyWith(selectedSymptoms: updatedSelectedSymptoms));
    });
    //
    on<ResetValuesEvent>((event, emit) async {
      emit(state.copyWith(selectedSymptoms: [], diagnosis: "", advices: []));
    });
    //
    on<ChangeLanguageEvent>((event, emit) {
      Locale newLocale =
          EasyLocalization.of(event.context)!.locale.languageCode == 'en'
              ? const Locale('ar')
              : const Locale('en');

      event.context.setLocale(newLocale);
      // تحديث EasyLocalization أيضًا
      emit(state.copyWith(locale: newLocale));
    });
  }
//
}
