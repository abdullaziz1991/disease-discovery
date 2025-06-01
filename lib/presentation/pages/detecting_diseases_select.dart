import 'package:disease_discovery_project/presentation/widgets/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../app/app_button.dart';
import '../../app/app_snack_bar.dart';
import '../bloc/diseases_discovery_bloc.dart';

// استيراد الكتل والأحداث والأنماط
// import your bloc, state, and events

class DetectingDiseasesSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
      builder: (context, state) {
        return ListView(
          children: [
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.all(8.sp),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Look for symptoms'.tr(),
                  border: const OutlineInputBorder(),
                ),
                onChanged: (q) => context
                    .read<DiseasesDiscoveryBloc>()
                    .add(SearchSymptoms(q)),
              ),
            ),
            SizedBox(
              height: 350.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.filteredSymptoms.length,
                itemBuilder: (ctx, i) {
                  final s = state.filteredSymptoms[i];
                  final sel = state.selectedSymptoms.contains(s);
                  return ListTile(
                    title: AppTextStyle(text: s.tr()),
                    trailing: sel
                        ? const Icon(Icons.check, color: Colors.green)
                        : null,
                    onTap: () => context
                        .read<DiseasesDiscoveryBloc>()
                        .add(ToggleSymptomSelection(s)),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (state.selectedSymptoms.isNotEmpty) {
                        context.read<DiseasesDiscoveryBloc>().add(
                              SendForDiagnosisEvent(context: context),
                            );
                      } else {
                        AppSnackBar.show(context,
                            "You have not selected any disease symptom".tr());
                      }
                    },
                    child: AppButton(
                      title: 'Diagnose Disease'.tr(),
                      width: 160.w,
                      marginTop: 0,
                      marginButton: state.diagnosis.isNotEmpty ? 0 : 20,
                    ),
                  ),
                  5.horizontalSpace,
                  InkWell(
                    onTap: () {
                      context
                          .read<DiseasesDiscoveryBloc>()
                          .add(ResetValuesEvent());
                    },
                    child: const Icon(Icons.sync, color: Color(0xFF8E0606)),
                  ),
                ],
              ),
            ),
            if (state.diagnosis.isNotEmpty || state.advices.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            final t = FlutterTts();
                            await t.setLanguage(context.locale.languageCode);
                            await t.speak(
                                '${"Diagnosis: ".tr()}: ${state.diagnosis.tr()}');
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.local_hospital,
                                  color: Colors.redAccent, size: 18),
                              8.horizontalSpace,
                              AppTextStyle(
                                  text: "Diagnosis: ".tr(),
                                  fontSize: 16,
                                  color: Colors.redAccent),
                              AppTextStyle(
                                  text: state.diagnosis.tr(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                        ),
                        const Divider(),
                        InkWell(
                          onTap: () async {
                            final t = FlutterTts();
                            await t.setLanguage(context.locale.languageCode);
                            final advText =
                                state.advices.map((a) => a.tr()).join('. ');
                            await t.speak('${'Advices'.tr()}: $advText');
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.tips_and_updates,
                                      color: Colors.blueAccent, size: 18),
                                  8.horizontalSpace,
                                  AppTextStyle(
                                      text: 'Advices'.tr() + ':',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent),
                                ],
                              ),
                              8.verticalSpace,
                              ...state.advices.map((a) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    leading: const Icon(Icons.check_circle,
                                        color: Colors.green),
                                    title: AppTextStyle(
                                        text: a.tr(), fontSize: 13),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: InkWell(
                            onTap: () => context
                                .read<DiseasesDiscoveryBloc>()
                                .add(ToggleSpeechEvent(context: context)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  state.isSpeaking
                                      ? Icons.stop
                                      : Icons.volume_up,
                                  color: Colors.deepPurple,
                                ),
                                8.horizontalSpace,
                                AppTextStyle(
                                  text: state.isSpeaking
                                      ? 'Stop Speaking'.tr()
                                      : 'Listen to Diagnosis & Advices'.tr(),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurple,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}









// class DetectingDiseasesSelect extends StatefulWidget {
//   @override
//   _DetectingDiseasesSelectState createState() =>
//       _DetectingDiseasesSelectState();
// }

// class _DetectingDiseasesSelectState extends State<DetectingDiseasesSelect> {
//   bool isSpeaking = false;
//   final FlutterTts flutterTts = FlutterTts();

//   Future<void> toggleSpeech(DiseasesDiscoveryState state) async {
//     if (isSpeaking) {
//       await flutterTts.stop();
//       setState(() => isSpeaking = false);
//     } else {
//       String combinedText = '';
//       if (state.diagnosis.isNotEmpty) {
//         combinedText += '${'Diagnosis'.tr()}: ${state.diagnosis.tr()}. ';
//       }
//       if (state.advices.isNotEmpty) {
//         final advText = state.advices.map((a) => a.tr()).join('. ');
//         combinedText += '${'Advices'.tr()}: $advText.';
//       }
//       await flutterTts.setLanguage(context.locale.languageCode);
//       await flutterTts.speak(combinedText);
//       setState(() => isSpeaking = true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
//       builder: (context, state) {
//         return ListView(
//           children: [
//             20.verticalSpace,

//             // بحث الأعراض
//             Padding(
//               padding: EdgeInsets.all(8.sp),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   labelText: 'Look for symptoms'.tr(),
//                   border: const OutlineInputBorder(),
//                 ),
//                 onChanged: (q) => context
//                     .read<DiseasesDiscoveryBloc>()
//                     .add(SearchSymptoms(q)),
//               ),
//             ),

//             // قائمة الأعراض
//             SizedBox(
//               height: 350.h,
//               child: ListView.builder(
//                 shrinkWrap: true,
//                 // physics: const NeverScrollableScrollPhysics(),
//                 itemCount: state.filteredSymptoms.length,
//                 itemBuilder: (ctx, i) {
//                   final s = state.filteredSymptoms[i];
//                   final sel = state.selectedSymptoms.contains(s);
//                   return ListTile(
//                     title: AppTextStyle(text: s.tr()),
//                     trailing: sel
//                         ? const Icon(Icons.check, color: Colors.green)
//                         : null,
//                     onTap: () => context
//                         .read<DiseasesDiscoveryBloc>()
//                         .add(ToggleSymptomSelection(s)),
//                   );
//                 },
//               ),
//             ),

//             // أزرار التشخيص والإعادة
//             Padding(
//               padding: EdgeInsetsDirectional.only(top: 10.h),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     onTap: () => context.read<DiseasesDiscoveryBloc>().add(
//                           SendForDiagnosisEvent(
//                             // method: DiagnosticMethod.fromSelection,
//                             context: context,
//                           ),
//                         ),
//                     child: AppButton(
//                       title: 'Diagnose Disease'.tr(),
//                       width: 160.w,
//                       marginTop: 0,
//                       marginButton: state.diagnosis.isNotEmpty ? 0 : 20,
//                     ),
//                   ),
//                   5.horizontalSpace,
//                   InkWell(
//                     onTap: () => context
//                         .read<DiseasesDiscoveryBloc>()
//                         .add(ResetValuesEvent()),
//                     child: const Icon(Icons.sync, color: Color(0xFF8E0606)),
//                   ),
//                 ],
//               ),
//             ),

//             // بطاقة التشخيص والنصائح
//             if (state.diagnosis.isNotEmpty || state.advices.isNotEmpty) ...[
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.sp)),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // سطر التشخيص
//                         InkWell(
//                           onTap: () async {
//                             final t = FlutterTts();
//                             await t.setLanguage(context.locale.languageCode);
//                             await t.speak(
//                                 '${'Diagnosis'.tr()}: ${state.diagnosis.tr()}');
//                           },
//                           child: Row(
//                             children: [
//                               const Icon(Icons.local_hospital,
//                                   color: Colors.redAccent, size: 18),
//                               8.horizontalSpace,
//                               AppTextStyle(
//                                   text: 'Diagnosis'.tr() + ':',
//                                   fontSize: 16,
//                                   color: Colors.redAccent),
//                               AppTextStyle(
//                                   text: state.diagnosis.tr(),
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w500),
//                             ],
//                           ),
//                         ),
//                         const Divider(),

//                         // قسم النصائح
//                         InkWell(
//                           onTap: () async {
//                             final t = FlutterTts();
//                             await t.setLanguage(context.locale.languageCode);
//                             final advText =
//                                 state.advices.map((a) => a.tr()).join('. ');
//                             await t.speak('${'Advices'.tr()}: $advText');
//                           },
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: [
//                                   const Icon(Icons.tips_and_updates,
//                                       color: Colors.blueAccent, size: 18),
//                                   8.horizontalSpace,
//                                   AppTextStyle(
//                                       text: 'Advices'.tr() + ':',
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.blueAccent),
//                                 ],
//                               ),
//                               8.verticalSpace,
//                               ...state.advices.map((a) => ListTile(
//                                     contentPadding: EdgeInsets.zero,
//                                     dense: true,
//                                     leading: const Icon(Icons.check_circle,
//                                         color: Colors.green),
//                                     title: AppTextStyle(
//                                         text: a.tr(), fontSize: 13),
//                                   )),
//                             ],
//                           ),
//                         ),

//                         // زر تشغيل/إيقاف النطق
//                         Padding(
//                           padding: const EdgeInsets.only(top: 16),
//                           child: InkWell(
//                             onTap: () => toggleSpeech(state),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Icon(isSpeaking ? Icons.stop : Icons.volume_up,
//                                     color: Colors.deepPurple),
//                                 8.horizontalSpace,
//                                 AppTextStyle(
//                                   text: isSpeaking
//                                       ? 'Stop Speaking'.tr()
//                                       : 'Listen to Diagnosis & Advices'.tr(),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600,
//                                   color: Colors.deepPurple,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         );
//       },
//     );
//   }
// }
























// class DetectingDiseasesSelect extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
//         builder: (context, state) {
//       return Column(children: [
//         // 🔹 مربع البحث عن الأعراض
//         20.verticalSpace,
//         Padding(
//             padding: EdgeInsets.all(8.sp),
//             child: TextFormField(
//                 decoration: InputDecoration(
//                     labelText: "Look for symptoms".tr(),
//                     border: const OutlineInputBorder()),
//                 onChanged: (query) {
//                   context
//                       .read<DiseasesDiscoveryBloc>()
//                       .add(SearchSymptoms(query));
//                 })),

//         // 🔹 قائمة الأعراض القابلة للاختيار
//         Expanded(
//             child: ListView.builder(
//                 itemCount: state.filteredSymptoms.length, //132
//                 itemBuilder: (context, index) {
//                   String symptom = state.filteredSymptoms[index];
//                   bool isSelected = state.selectedSymptoms.contains(symptom);
//                   return ListTile(
//                       title: AppTextStyle(text: symptom.tr()),
//                       trailing: isSelected
//                           ? const Icon(Icons.check, color: Colors.green)
//                           : null,
//                       onTap: () {
//                         context
//                             .read<DiseasesDiscoveryBloc>()
//                             .add(ToggleSymptomSelection(symptom));
//                       });
//                 })),
//         // 🔹 زر التشخيص
//         Padding(
//             padding: EdgeInsetsDirectional.only(top: 10.h),
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         context
//                             .read<DiseasesDiscoveryBloc>()
//                             .add(SendForDiagnosisEvent(
//                                 //   method: DiagnosticMethod.fromSelection,
//                                 context: context));
//                       },
//                       child: AppButton(
//                         title: "Diagnose Disease".tr(),
//                         width: 160.w,
//                         marginTop: 0,
//                         marginButton: state.diagnosis.isNotEmpty ? 0 : 20,
//                       )),
//                   5.horizontalSpace,
//                   InkWell(
//                       onTap: () {
//                         context
//                             .read<DiseasesDiscoveryBloc>()
//                             .add(ResetValuesEvent());
//                       },
//                       child: const Icon(Icons.sync, color: Color(0xFF8E0606))),
//                 ])),
//         if (state.diagnosis.isNotEmpty || state.advices.isNotEmpty) ...[
//           Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Card(
//                   elevation: 4, // تأثير الظل للكارد
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12.sp)),
//                   child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             InkWell(
//                                 onTap: () async {
//                                   final FlutterTts flutterTts = FlutterTts();
//                                   await flutterTts.speak(state.diagnosis);
//                                 },
//                                 child: Row(children: [
//                                   const Icon(Icons.local_hospital,
//                                       color: Colors.redAccent, size: 18),
//                                   8.horizontalSpace,
//                                   AppTextStyle(
//                                       text: "Diagnosis:  ".tr(),
//                                       fontSize: 16,
//                                       color: Colors.redAccent),
//                                   AppTextStyle(
//                                       text: state.diagnosis.tr(),
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.w500)
//                                 ])),
//                             const Divider(),
//                             InkWell(
//                                 onTap: () => speakAdvices(state.advices),
//                                 child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(children: [
//                                         const Icon(Icons.tips_and_updates,
//                                             color: Colors.blueAccent, size: 18),
//                                         8.horizontalSpace,
//                                         AppTextStyle(
//                                             text: "Advices: ".tr(),
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.blueAccent)
//                                       ]),
//                                       8.verticalSpace,
//                                       ...state.advices.map((advice) {
//                                         return ListTile(
//                                             contentPadding: EdgeInsets.zero,
//                                             minVerticalPadding: 0,
//                                             dense:
//                                                 true, // 🔹 يقلل المسافة العمودية بين العناصر
//                                             leading: const Icon(
//                                                 Icons.check_circle,
//                                                 color: Colors.green),
//                                             title:

//                                                 // Text(advice.tr(),style: TextStyle(fontSize:13))
//                                                 AppTextStyle(
//                                                     text: advice.tr(),
//                                                     fontSize: 13));
//                                       }).toList(),
//                                     ]))
//                           ]))))
//         ]
//       ]);
//     });
//   }
// }
