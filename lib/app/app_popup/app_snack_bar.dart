import '../app_theme/extension.dart';
import '../methods/app_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../methods/app_text_style.dart';

class AppSnackBar {
  static void show(BuildContext context, String message,
      {bool buttonVisibility = false, double fontSize = 13}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: IntrinsicHeight(
            // لتوسيط المحتوى عموديًا إن أمكن
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
              child: AppTextStyle(
                  text: message,
                  color: context.colorScheme.onSecondary,
                  fontSize: fontSize)),
          if (buttonVisibility)
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    },
                    child: AppButton(
                        title: "Close".tr(),
                        fontSize: fontSize,
                        width: 55.w,
                        marginTop: 0,
                        marginButton: 0,
                        marginEnd: 0)))
        ])),
        backgroundColor: context.colorScheme.secondary,
        duration: buttonVisibility
            ? const Duration(days: 10)
            : const Duration(seconds: 3)));
  }
}
