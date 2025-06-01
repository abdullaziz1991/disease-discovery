import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../app/app_button.dart';
import '../bloc/diseases_discovery_bloc.dart';
import '../functions/tts_helper.dart';
import '../widgets/app_text_style.dart';

class DetectingDiseasesMicrophone extends StatefulWidget {
  const DetectingDiseasesMicrophone({super.key});
  @override
  State<DetectingDiseasesMicrophone> createState() =>
      _DetectingDiseasesMicrophoneState();
}

class _DetectingDiseasesMicrophoneState
    extends State<DetectingDiseasesMicrophone>
    with SingleTickerProviderStateMixin {
  // SingleTickerProviderStateMixin يسمح لهذا الـ State بأن يكون مصدرًا لـ Ticker (ضروري للرسوم المتحركة في AnimationController).

  late AnimationController _controller;
  late Animation<double> _animation;
  // AnimationController هو المسؤول عن تشغيل وإدارة الرسوم المتحركة.
  //Animation<double> يقوم بتحديد القيم المتغيرة خلال الرسوم المتحركة.

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    // تكرار التأثير ذهابًا وإيابًا
    // vsync هو اختصار لـ Vertical Synchronization، وهو مسؤول عن التحكم في معدل تحديث الإطارات لتوفير أداء سلس للرسوم المتحركة.
    // وظيفته الأساسية هي منع استهلاك غير ضروري للمعالج (CPU) أو وحدة معالجة الرسوميات (GPU) عن طريق تشغيل الرسوم المتحركة فقط عندما يكون هناك تحديث في الشاشة.

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.stop(); // يبدأ التوقف حتى يتم تشغيله عند النقر
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
            builder: (context, state) {
          // print(state.isListening);
          // print("state.isListening --------------------------");
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            AppTextStyle(text: "Press and talk".tr(), fontSize: 16.sp),
            20.verticalSpace,
            AppTextStyle(
                text: state.recognizedText.isEmpty
                    ? "No text has been recorded yet".tr()
                    : state.recognizedText,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold),
            20.verticalSpace,
            InkWell(
                onTap: () {
                  context
                      .read<DiseasesDiscoveryBloc>()
                      .add(ToggleListeningEvent(context: context));
                  _controller.repeat(reverse: true);
                },
                child: Stack(alignment: Alignment.center, children: [
                  if (state.isListening)
                    AnimatedBuilder(
                        // AnimatedBuilder يجعل الزر يتحرك بحجم متغير عند الاستماع.
                        animation: _animation,
                        builder: (context, child) {
                          return Transform.scale(
                              // يجعل الحجم يتغير من 1.0 إلى 1.5.
                              scale: _animation.value,
                              child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xFFFFD3D3)
                                          .withOpacity(0.5))));
                        }),
                        // دائما موجود
                  Container(
                      padding: const EdgeInsets.all(60),
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFE5E5),
                        shape: BoxShape.circle,
                        //borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(state.isListening ? Icons.mic_off : Icons.mic,
                          size: 30))
                ])),
            10.verticalSpace,
            Padding(
                padding: EdgeInsetsDirectional.only(top: 15.h),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                          onTap: () {
                            context
                                .read<DiseasesDiscoveryBloc>()
                                .add(SendForDiagnosisEvent(
                                    //   method: DiagnosticMethod.fromMic,
                                    context: context));
                          },
                          child: AppButton(
                              title: "Diagnose Disease".tr(), width: 160.w)),
                      5.horizontalSpace,
                      InkWell(
                          onTap: () {
                            context
                                .read<DiseasesDiscoveryBloc>()
                                .add(ResetValuesEvent());
                            context
                                .read<DiseasesDiscoveryBloc>()
                                .add(ClearRecognizedTextEvent());
                          },
                          child:
                              const Icon(Icons.sync, color: Color(0xFF8E0606))),
                    ])),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.selectedSymptoms.length,
                itemBuilder: (context, index) {
                  String symptom = state.selectedSymptoms[index];
                  return ListTile(
                      title: AppTextStyle(text: symptom.tr()),
                      trailing: const Icon(Icons.check, color: Colors.green),
                      onTap: () {
                        context
                            .read<DiseasesDiscoveryBloc>()
                            .add(ToggleSymptomSelection(symptom));
                      });
                }),
            if (state.diagnosis.isNotEmpty || state.advices.isNotEmpty) ...[
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                      elevation: 4, // تأثير الظل للكارد
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: () async {
                                      final FlutterTts flutterTts =
                                          FlutterTts();
                                      await flutterTts.speak(state.diagnosis);
                                    },
                                    child: Row(children: [
                                      const Icon(Icons.local_hospital,
                                          color: Colors.redAccent, size: 18),
                                      8.horizontalSpace,
                                      AppTextStyle(
                                          text: "Diagnosis:  ".tr(),
                                          fontSize: 16,
                                          color: Colors.redAccent),
                                      AppTextStyle(
                                          text: state.diagnosis.tr(),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)
                                    ])),
                                const Divider(),
                                InkWell(
                                    onTap: () => speakAdvices(state.advices),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            const Icon(Icons.tips_and_updates,
                                                color: Colors.blueAccent,
                                                size: 18),
                                            8.horizontalSpace,
                                            AppTextStyle(
                                                text: "Advices: ".tr(),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blueAccent)
                                          ]),
                                          8.verticalSpace,
                                          ...state.advices.map((advice) {
                                            // في Dart، الثلاث نقاط ... تُعرف باسم spread operator (مُعامل النشر)، وهي تُستخدم لنشر عناصر Iterable
                                            // (مثل List) داخل children مباشرةً بدلاً من وضعها ككائن List منفصل.
                                            return ListTile(
                                                contentPadding: EdgeInsets.zero,
                                                minVerticalPadding: 0,
                                                dense:
                                                    true, // 🔹 يقلل المسافة العمودية بين العناصر
                                                leading: const Icon(
                                                    Icons.check_circle,
                                                    color: Colors.green),
                                                title: AppTextStyle(
                                                    text: advice.tr(),
                                                    fontSize: 13));
                                          }).toList(),
                                        ]))
                              ]))))
            ]
          ]);
        }),
      ),
    );
  }
}
