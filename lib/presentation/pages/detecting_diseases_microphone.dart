import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/app_button.dart';
import '../../app/enum_file.dart';
import '../bloc/diseases_discovery_bloc.dart';
import '../widgets/app_text_style.dart';

class DetectingDiseasesMicrophone extends StatefulWidget {
  const DetectingDiseasesMicrophone({super.key});

  @override
  State<DetectingDiseasesMicrophone> createState() =>
      _DetectingDiseasesMicrophoneState();
}

class _DetectingDiseasesMicrophoneState
    extends State<DetectingDiseasesMicrophone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
                builder: (context, state) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('اضغط على الزر وتحدث عن أعراضك',
                        style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
                    Text(
                      state.recognizedText.isEmpty
                          ? 'لم يتم تسجيل أي نص بعد.'
                          : state.recognizedText,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<DiseasesDiscoveryBloc>()
                                .add(ToggleListeningEvent());
                          },
                          child: Icon(
                              state.isListening ? Icons.mic_off : Icons.mic),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<DiseasesDiscoveryBloc>()
                                .add(ClearRecognizedTextEvent());
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                    10.verticalSpace,
                    Padding(
                        padding: EdgeInsetsDirectional.only(top: 15.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () {
                                    context.read<DiseasesDiscoveryBloc>().add(
                                        SendForDiagnosisEvent(
                                            method: DiagnosticMethod.fromMic, context: context));
                                  },
                                  child: AppButton(
                                      title: "Diagnose Disease".tr(),
                                      width: 160.w)),
                              5.horizontalSpace,
                              InkWell(
                                  onTap: () {
                                    context
                                        .read<DiseasesDiscoveryBloc>()
                                        .add(ResetValuesEvent());
                                  },
                                  child: const Icon(Icons.delete,
                                      color: Color(0xFF8E0606))),
                            ])),
                    if (state.diagnosis.isNotEmpty ||
                        state.advices.isNotEmpty) ...[
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                              elevation: 4, // تأثير الظل للكارد
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // 🔹 عرض التشخيص داخل Card
                                        Row(children: [
                                          const Icon(Icons.local_hospital,
                                              color: Colors.redAccent,
                                              size: 18),
                                          8.horizontalSpace,
                                          AppTextStyle(
                                              text: "Diagnosis:  ".tr(),
                                              fontSize: 17,
                                              color: Colors.redAccent),
                                          AppTextStyle(
                                              text: state.diagnosis.tr(),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ]),
                                        const Divider(),

                                        // 🔹 عرض النصائح بشكل قائمة أنيقة
                                        Row(children: [
                                          const Icon(Icons.tips_and_updates,
                                              color: Colors.blueAccent),
                                          8.horizontalSpace,
                                          AppTextStyle(
                                              text: "Advices: ".tr(),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueAccent)
                                        ]),
                                        8.verticalSpace,
                                        Column(
                                            children:
                                                state.advices.map((advice) {
                                          return ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              leading: const Icon(
                                                  Icons.check_circle,
                                                  color: Colors.green),
                                              title: AppTextStyle(
                                                  text: advice.tr(),
                                                  fontSize: 14));
                                        }).toList())
                                      ]))))
                    ]
                  ]);
            })));
  }
}



//
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:flutter/material.dart';

// class SymptomCheckerPage extends StatefulWidget {
//   const SymptomCheckerPage({super.key});

//   @override
//   State<SymptomCheckerPage> createState() => _SymptomCheckerPageState();
// }

// class _SymptomCheckerPageState extends State<SymptomCheckerPage> {
//   late stt.SpeechToText _speech;
//   bool _isListening = false;
//   String _recognizedText = '';
//   String _diagnosis = '';
//   String _removeDuplicateWords(String text) {
//     List<String> words = text.split(" ");
//     Set<String> uniqueWords = {};

//     List<String> filteredWords = words.where((word) {
//       if (uniqueWords.contains(word)) {
//         return false; // إذا كانت الكلمة موجودة بالفعل، لا تضفها
//       } else {
//         uniqueWords.add(word);
//         return true; // أضف الكلمة فقط إذا لم تكن موجودة من قبل
//       }
//     }).toList();

//     return filteredWords.join(" ");
//   }

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//   }

//   Future<void> _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize();
//       if (available) {
//         setState(() => _isListening = true);
//         _speech.listen(
//           onResult: (result) {
//             setState(() {
//               _recognizedText = _removeDuplicateWords(
//                   _recognizedText += " ${result.recognizedWords}");
//             });
//           },
//           localeId: 'ar_EG',
//         );
//       }
//     } else {
//       setState(() => _isListening = false);
//       _speech.stop();
//     }
//   }

//   void _clearText() {
//     setState(() {
//       _recognizedText = '';
//       _diagnosis = '';
//     });
//   }

//   Map<String, String> _extractSymptoms(String text) {
//     Map<String, String> symptoms = {
//       "muscle_pain": "0",
//       "itching": "0",
//       "altered_sensorium": "0"
//     };

//     if (text.contains("الم عضلات")) {
//       symptoms["muscle_pain"] = "1";
//     }
//     if (text.contains("مثير للحكة")) {
//       symptoms["itching"] = "1";
//     }
//     if (text.contains("حاسة متغيرة")) {
//       symptoms["altered_sensorium"] = "1";
//     }

//     return symptoms;
//   }

//   Future<void> _sendForDiagnosis() async {
//     final url = Uri.parse('http://192.168.1.130:5000/predict');

//     Map<String, String> symptomsData = _extractSymptoms(_recognizedText);
//     final response = await http.post(url,
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(symptomsData));

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() =>
//           _diagnosis = data['advice'].join(", ") + "\n" + data['disease']);
//     } else {
//       setState(() => _diagnosis = 'حدث خطأ أثناء التشخيص.');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('تشخيص الأعراض')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('اضغط على الزر وتحدث عن أعراضك',
//                 style: TextStyle(fontSize: 18)),
//             const SizedBox(height: 20),
//             Text(
//               _recognizedText.isEmpty
//                   ? 'لم يتم تسجيل أي نص بعد.'
//                   : _recognizedText,
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: _listen,
//                   child: Icon(_isListening ? Icons.mic_off : Icons.mic),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: _clearText,
//                   child: const Icon(Icons.delete),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _sendForDiagnosis,
//               child: const Text('تشخيص'),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _diagnosis.isEmpty ? '' : 'التشخيص المحتمل: $_diagnosis',
//               style: const TextStyle(fontSize: 20, color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

