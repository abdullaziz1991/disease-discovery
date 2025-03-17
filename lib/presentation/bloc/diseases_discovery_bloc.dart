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
      if (!state.isListening) {
        bool available = await _speech.initialize();
        if (available) {
          emit(state.copyWith(isListening: true));
          _speech.listen(
              

              onResult: (result) {
                add(UpdateRecognizedTextEvent(result.recognizedWords));
              },
              localeId: 'ar_EG');
        }
      } else {
        emit(state.copyWith(isListening: false));
        _speech.stop();
      }
    });
    // 2
    on<UpdateRecognizedTextEvent>((event, emit) async {
      String updatedText =
          removeDuplicateWords("${state.recognizedText} ${event.newText}");
      print(updatedText);
      emit(state.copyWith(recognizedText: updatedText));
    });
    //3
    on<ClearRecognizedTextEvent>((event, emit) async {
      emit(state.copyWith(recognizedText: ""));
    });
    //4
    on<SendForDiagnosisEvent>((event, emit) async {
      final url = Uri.parse('http://192.168.1.130:5000/predict');
      //final url = Uri.parse('http://192.168.215.129:5000/predict');

      late Map<String, String> symptomsData;
      if (event.method == DiagnosticMethod.fromMic) {
        symptomsData = extractSymptoms(state.recognizedText);
      } else {
        ChangeList changeList = ChangeList(state.selectedSymptoms);
        symptomsData = changeList.getUpdatedList();
      }

      try {
        final response = await http
            .post(url,
                headers: {'Content-Type': 'application/json'},
                body: jsonEncode(symptomsData))
            .timeout(const Duration(seconds: 2));
        // تحديد مهلة 10 ثوانٍ
        if (response.statusCode == 200) {
          Map<String, dynamic> data = json.decode(response.body);
          String disease = data["disease"];
          List<String> adviceList = List<String>.from(data["advice"]);
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
      print(event.query.toLowerCase());
      print("event.query.toLowerCase( -----------------------)");
      List<String> results = allSymptoms.where((symptom) {
        return symptom.toLowerCase().tr().contains(event.query.toLowerCase());
      }).toList();
      // ترتيب القائمة بحيث تكون الأعراض المختارة في الأعلى

      //results= [continuous_sneezing, nodal_skin_eruptions, skin_rash, joint_pain, stomach_pain, acidity]
      // selectedSymptoms= [nodal_skin_eruptions, stomach_pain]
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

    on<ToggleSymptomSelection>((event, emit) async {
      List<String> updatedSelectedSymptoms = List.from(state.selectedSymptoms);
      print(updatedSelectedSymptoms);
      print("updatedSelectedSymptoms ------------------------------");
      if (updatedSelectedSymptoms.contains(event.symptom)) {
        print("  if  -------------");
        updatedSelectedSymptoms.remove(event.symptom);
      } else {
        print("  elseee  -------------");
        updatedSelectedSymptoms.add(event.symptom);
      }

      // إعادة ترتيب القائمة بعد تحديث الاختيارات
      add(SearchSymptoms(''));
      emit(state.copyWith(selectedSymptoms: updatedSelectedSymptoms));
    });
    on<ResetValuesEvent>((event, emit) async {
      emit(state.copyWith(selectedSymptoms: [], diagnosis: "", advices: []));
    });
  }
//
}


 // final url = Uri.parse('http://192.168.1.130:5000/predict');
      // //final url = Uri.parse('http://192.168.215.129:5000/predict');
      // late Map<String, String> symptomsData;

      // if (event.method == DiagnosticMethod.fromMic) {
      //   symptomsData = extractSymptoms(state.recognizedText);
      // } else {
      //   ChangeList changeList = ChangeList(state.selectedSymptoms);
      //   // استرجاع القائمة الجديدة
      //   symptomsData = changeList.getUpdatedList();
      // }
      // final response = await http.post(url,
      //     headers: {'Content-Type': 'application/json'},
      //     body: jsonEncode(symptomsData));
      // print(response.statusCode);
      // print("response.statusCode ----------------------");
      // if (response.statusCode == 200) {
      //   Map<String, dynamic> data = json.decode(response.body);
      //   String disease = data["disease"];
      //   List<String> adviceList = List<String>.from(data["advice"]);
      //   emit(state.copyWith(diagnosis: disease, advices: adviceList));
      // } else {
      //   emit(state.copyWith(diagnosis: "حدث خطأ اثناء التشخيص", advices: []));
      //   //  setState(() => _diagnosis = 'حدث خطأ أثناء التشخيص.');
      // }