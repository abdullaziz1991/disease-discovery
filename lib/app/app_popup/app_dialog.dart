import '../methods/app_text_style.dart';
import '../app_theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_basic_widget/app_text_form_field.dart';
import '../methods/app_button.dart';

class AppDialog {
  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    VoidCallback? callback,
    ValueChanged<dynamic>? valueChange,
    bool cancelVisibility = false,
    bool fieldVisibility = false,
    String? fieldHint,
  }) {
    return showDialog(
        context: context,
        builder: (context) {
          TextEditingController dialogController = TextEditingController();
          return AlertDialog(
              backgroundColor: context.colorScheme.primaryContainer,
              title: AppTextStyle(
                  textAlign: TextAlign.center,
                  text: title,
                  fontSize: 18.sp,
                  color: context.colorScheme.primary),
              content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextStyle(
                        text: message,
                        fontSize: 11.sp,
                        color: context.colorScheme.secondary),
                    5.verticalSpace,
                    Visibility(
                        visible: fieldVisibility,
                        child: AppTextFormField(
                            value: fieldHint ?? "",
                            // validator1:
                            //     "Product Title can't to be larger than 30 letter"
                            //         .tr(),
                            // validator2:
                            //     "Product Title can't to be less than 2 letter".tr(),
                            icon: Icons.article,
                            textInputType: TextInputType.text,
                            maxLenght: 30,
                            minLenght: 2,
                            controllers: dialogController,
                            hintText: fieldHint ?? "",
                            onChanged: (newValue) {
                              valueChange!(newValue);
                            },
                            // padding: 10.r,
                            contentPadding: 15.r))
                  ]),
              actions: [
                InkWell(
                    onTap: callback,
                    child: AppButton(title: "Ok".tr(), width: 75.w)),
                Visibility(
                    visible: cancelVisibility,
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: AppButton(title: "Cancel".tr(), width: 75.w)))
              ]);
        });
  }
}
