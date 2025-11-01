import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../../../app/app_button.dart';
import '../bloc/diseases_discovery_bloc.dart';
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
  late AnimationController _controller;
  late Animation<double> _animation;
  bool isSpeaking = false;
  bool isDiagnosisSpoken = false;
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    flutterTts.stop();
    super.dispose();
  }

  Future<void> toggleSpeech(DiseasesDiscoveryState state) async {
    if (isSpeaking) {
      await flutterTts.stop();
      setState(() => isSpeaking = false);
    } else {
      String combinedText = '';
      if (state.diagnosis.isNotEmpty) {
        combinedText += '${'Diagnosis'.tr()}: ${state.diagnosis.tr()}. ';
      }
      if (state.advices.isNotEmpty) {
        final advText = state.advices.map((a) => a.tr()).join('. ');
        combinedText += '${'Advices'.tr()}: $advText.';
      }
      await flutterTts.setLanguage(context.locale.languageCode);
      await flutterTts.speak(combinedText);
      setState(() => isSpeaking = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: SingleChildScrollView(child:
                BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
                    builder: (context, state) {
              if (state.isListening) {
                _controller.repeat(reverse: true);
              } else {
                _controller.stop();
              }

              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppTextStyle(text: "Press and talk".tr(), fontSize: 16.sp),
                    const SizedBox(height: 20),
                    AppTextStyle(
                      text: state.recognizedText.isEmpty
                          ? "No text has been recorded yet".tr()
                          : state.recognizedText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                        onTap: () {
                          context
                              .read<DiseasesDiscoveryBloc>()
                              .add(ToggleListeningEvent(context: context));
                        },
                        child: Stack(alignment: Alignment.center, children: [
                          if (state.isListening)
                            AnimatedBuilder(
                                animation: _animation,
                                builder: (context, child) {
                                  return Transform.scale(
                                      scale: _animation.value,
                                      child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: const Color(0xFFFFD3D3)
                                                  .withOpacity(0.5))));
                                }),
                          Container(
                              padding: const EdgeInsets.all(60),
                              decoration: const BoxDecoration(
                                  color: Color(0xFFFFE5E5),
                                  shape: BoxShape.circle),
                              child: Icon(
                                  state.isListening ? Icons.mic_off : Icons.mic,
                                  size: 30))
                        ])),
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsetsDirectional.only(top: 15.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                  onTap: () async {
                                    setState(() => isDiagnosisSpoken = false);
                                    final bloc =
                                        context.read<DiseasesDiscoveryBloc>();
                                    bloc.add(SendForDiagnosisEvent(
                                        context: context));

                                    await Future.delayed(
                                        const Duration(milliseconds: 800));

                                    final state = bloc.state;

                                    String combinedText = '';
                                    if (state.diagnosis.isNotEmpty) {
                                      combinedText +=
                                          '${'Diagnosis'.tr()}: ${state.diagnosis.tr()}. ';
                                    }
                                    if (state.advices.isNotEmpty) {
                                      final advText = state.advices
                                          .map((a) => a.tr())
                                          .join('. ');
                                      combinedText +=
                                          '${'Advices'.tr()}: $advText.';
                                    }

                                    final tts = FlutterTts();
                                    await tts.setLanguage(
                                        context.locale.languageCode);
                                    await tts.speak(combinedText);

                                    tts.setCompletionHandler(() {
                                      setState(() {
                                        isDiagnosisSpoken = true;
                                      });
                                    });
                                  },
                                  child: AppButton(
                                      title: "Diagnose Disease".tr(),
                                      width: 160.w)),
                              const SizedBox(width: 5),
                              InkWell(
                                  onTap: () {
                                    context
                                        .read<DiseasesDiscoveryBloc>()
                                        .add(ResetValuesEvent());
                                    context
                                        .read<DiseasesDiscoveryBloc>()
                                        .add(ClearRecognizedTextEvent());
                                  },
                                  child: const Icon(Icons.sync,
                                      color: Color(0xFF8E0606)))
                            ])),

                    // جاري النطق
                    if ((state.diagnosis.isNotEmpty ||
                            state.advices.isNotEmpty) &&
                        !isDiagnosisSpoken)
                      InkWell(
                          onTap: () async {
                            setState(() {
                              isSpeaking = true;
                              toggleSpeech(state);
                              isDiagnosisSpoken = true;
                            });
                          },
                          child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            color: Colors.deepPurple)),
                                    const SizedBox(width: 12),
                                    AppTextStyle(
                                        text: "Speaking...".tr(),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple)
                                  ]))),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.selectedSymptoms.length,
                        itemBuilder: (context, index) {
                          String symptom = state.selectedSymptoms[index];
                          return ListTile(
                              title: AppTextStyle(text: symptom.tr()),
                              trailing:
                                  const Icon(Icons.check, color: Colors.green),
                              onTap: () {
                                // context
                                //     .read<DiseasesDiscoveryBloc>()
                                //     .add(ToggleSymptomSelection(symptom));
                              });
                        }),
                    if ((state.diagnosis.isNotEmpty ||
                            state.advices.isNotEmpty) &&
                        isDiagnosisSpoken)
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.sp),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // التشخيص
                                        InkWell(
                                            onTap: () async {
                                              final t = FlutterTts();
                                              await t.setLanguage(
                                                  context.locale.languageCode);
                                              await t.speak(
                                                  '${"Diagnosis: ".tr()} ${state.diagnosis.tr()}');
                                            },
                                            child: Row(children: [
                                              const Icon(Icons.local_hospital,
                                                  color: Colors.redAccent,
                                                  size: 18),
                                              SizedBox(width: 8),
                                              AppTextStyle(
                                                  text: "Diagnosis: ".tr(),
                                                  fontSize: 16,
                                                  color: Colors.redAccent),
                                              AppTextStyle(
                                                  text: state.diagnosis.tr(),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500)
                                            ])),
                                        const Divider(),
                                        // النصائح
                                        InkWell(
                                            onTap: () async {
                                              final t = FlutterTts();
                                              await t.setLanguage(
                                                  context.locale.languageCode);
                                              final advText = state.advices
                                                  .map((a) => a.tr())
                                                  .join('. ');
                                              await t.speak(
                                                  '${'Advices'.tr()}: $advText');
                                            },
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(children: [
                                                    const Icon(
                                                        Icons.tips_and_updates,
                                                        color:
                                                            Colors.blueAccent,
                                                        size: 18),
                                                    const SizedBox(width: 8),
                                                    AppTextStyle(
                                                        text: 'Advices'.tr() +
                                                            ':',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color:
                                                            Colors.blueAccent)
                                                  ]),
                                                  SizedBox(height: 8),
                                                  ...state.advices.map((a) =>
                                                      ListTile(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                          dense: true,
                                                          leading: const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green),
                                                          title: AppTextStyle(
                                                              text: a.tr(),
                                                              fontSize: 13)))
                                                ])),

                                        // زر الصوت
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: InkWell(
                                                onTap: () =>
                                                    toggleSpeech(state),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                          isSpeaking
                                                              ? Icons.stop
                                                              : Icons.volume_up,
                                                          color: Colors
                                                              .deepPurple),
                                                      8.horizontalSpace,
                                                      AppTextStyle(
                                                          text: isSpeaking
                                                              ? 'Stop Speaking'
                                                                  .tr()
                                                              : 'Listen to Diagnosis & Advices'
                                                                  .tr(),
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color:
                                                              Colors.deepPurple)
                                                    ])))
                                      ]))))
                  ]);
            }))));
  }
}
