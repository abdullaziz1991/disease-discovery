import 'package:disease_discovery_project/app/enum_file.dart';
import 'package:disease_discovery_project/presentation/widgets/app_text_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/app_button.dart';
import '../bloc/diseases_discovery_bloc.dart';

class DetectingDiseasesSelect extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<DiseasesDiscoveryBloc, DiseasesDiscoveryState>(
            builder: (context, state) {
      return Column(children: [
        // 🔹 مربع البحث عن الأعراض
        Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    labelText: "Look for symptoms".tr(),
                    border: OutlineInputBorder()),
                onChanged: (query) {
                  context
                      .read<DiseasesDiscoveryBloc>()
                      .add(SearchSymptoms(query));
                })),

        // 🔹 قائمة الأعراض القابلة للاختيار
        Expanded(
            child: ListView.builder(
                itemCount: state.filteredSymptoms.length,
                itemBuilder: (context, index) {
                  String symptom = state.filteredSymptoms[index];
                  bool isSelected = state.selectedSymptoms.contains(symptom);
                  return ListTile(
                      title: AppTextStyle(text: symptom.tr()),
                      trailing: isSelected
                          ? const Icon(Icons.check, color: Colors.green)
                          : null,
                      onTap: () {
                        context
                            .read<DiseasesDiscoveryBloc>()
                            .add(ToggleSymptomSelection(symptom));
                      });
                })),
        // 🔹 زر التشخيص
        Padding(
            padding: EdgeInsetsDirectional.only(top: 10.h),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        context.read<DiseasesDiscoveryBloc>().add(
                            SendForDiagnosisEvent(
                                method: DiagnosticMethod.fromSelection,
                                context: context));
                      },
                      child: AppButton(
                        title: "Diagnose Disease".tr(),
                        width: 160.w,
                        marginTop: 0,
                        marginButton: state.diagnosis.isNotEmpty ? 0 : 20,
                      )),
                  5.horizontalSpace,
                  InkWell(
                      onTap: () {
                        context
                            .read<DiseasesDiscoveryBloc>()
                            .add(ResetValuesEvent());
                      },
                      child: const Icon(Icons.sync, color: Color(0xFF8E0606))),
                ])),
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
                            // 🔹 عرض التشخيص داخل Card
                            Row(children: [
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
                            ]),
                            const Divider(),

                            // 🔹 عرض النصائح بشكل قائمة أنيقة
                            Row(children: [
                              const Icon(Icons.tips_and_updates,
                                  color: Colors.blueAccent, size: 18),
                              8.horizontalSpace,
                              AppTextStyle(
                                  text: "Advices: ".tr(),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent)
                            ]),

                            Column(
                                mainAxisSize: MainAxisSize.min,
                                children: state.advices.map((advice) {
                                  return ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: const Icon(Icons.check_circle,
                                          color: Colors.green),
                                      title: AppTextStyle(
                                          text: advice.tr(), fontSize: 13));
                                }).toList())
                          ]))))
        ]
      ]);
    }));
  }
}
