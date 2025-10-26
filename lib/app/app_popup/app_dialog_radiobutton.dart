import '../methods/app_text_style.dart';
import '../../core/helper/navigation_helper.dart';
import '../app_theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/strings/constants.dart';
import '../methods/app_button.dart';


class AppDialogRadiobutton {
  static Future<void> show(
      {required BuildContext context, required ValueChanged<int?> sortBy}) {
    String? selectedOption = sortByList[0].tr();
    int selectedIndex = 0;
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
            // إزالة الهوامش الافتراضية
            child: Container(
              width: MediaQuery.of(context).size.width, // أخذ كامل عرض الشاشة
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              decoration: BoxDecoration(
                  color: context.colorScheme.surface,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: context.colorScheme.onSurface)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextStyle(
                      text: "Sort by".tr(),
                      fontSize: 16.sp, // تصغير حجم النص الرئيسي
                      color: context.colorScheme.onSurface),
                  10.verticalSpace,
                  StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile<String>(
                              title: AppTextStyle(
                                  text: sortByList[0].tr(),
                                  fontSize: 12.sp,
                                  color: context.colorScheme.onSurface),
                              contentPadding: EdgeInsets.zero, // إزالة الهوامش
                              dense: true, // تقليل المسافات الرأسية
                              activeColor: context.colorScheme.errorContainer,
                              value: sortByList[0].tr(),
                              groupValue: selectedOption,
                              //tileColor: context.colorScheme.errorContainer,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                  selectedIndex = 0;
                                });
                              }),
                          RadioListTile<String>(
                              title: AppTextStyle(
                                  text: sortByList[1].tr(),
                                  fontSize: 12.sp,
                                  color: context.colorScheme.onSurface),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              activeColor: context.colorScheme.errorContainer,
                              
                              // selectedTileColor:
                              //     context.colorScheme.errorContainer,
                              // hoverColor: context.colorScheme.errorContainer,
                              value: sortByList[1].tr(),
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                  selectedIndex = 1;
                                });
                              }),
                          RadioListTile<String>(
                              title: AppTextStyle(
                                  text: sortByList[2].tr(),
                                  fontSize: 12.sp,
                                  color: context.colorScheme.onSurface),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              activeColor: context.colorScheme.errorContainer,
                              value: sortByList[2].tr(),
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                  selectedIndex = 2;
                                });
                              }),
                          RadioListTile<String>(
                              title: AppTextStyle(
                                  text: sortByList[3].tr(),
                                  fontSize: 12.sp,
                                  color: context.colorScheme.onSurface),
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              activeColor: context.colorScheme.errorContainer,
                              value: sortByList[3].tr(),
                              groupValue: selectedOption,
                              onChanged: (value) {
                                setState(() {
                                  selectedOption = value;
                                  selectedIndex = 3;
                                });
                              }),
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                          onTap: () {
                            sortBy(selectedIndex);
                            NavigationHelper.pop(context);
                          },
                          child: AppButton(title: "Ok".tr(), width: 75.w)),
                      // SizedBox(width: 8.w),
                      // InkWell(
                      //   onTap: () => Navigator.of(context).pop(),
                      //   child: AppButton(title: "Cancel".tr(), width: 75.w),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
