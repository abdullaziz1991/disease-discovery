// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../features/diseases_discovery/presentation/widgets/app_text_style.dart';

class AppButton extends StatelessWidget {
  final String title;
  // final BuildContext context;
  final double width;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? horizontalmargin;
  final double? verticalmargin;
  final double? marginStart;
  final double? marginEnd;
  final double? marginTop;
  final double? marginButton;
  const AppButton({
    super.key,
    required this.title,
    required this.width,
    this.fontSize,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.horizontalmargin,
    this.verticalmargin,
    this.marginStart,
    this.marginEnd,
    this.marginTop,
    this.marginButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.symmetric(
        //     vertical: verticalmargin ?? 5.w, horizontal: horizontalmargin ?? 0),
        margin: EdgeInsetsDirectional.only(
            start: marginStart ?? 7.w,
            end: marginEnd ?? 7.w,
            top: marginTop ?? 7.h,
            bottom: marginButton ?? 7.h),
        padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 10.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            //  color: backgroundColor ?? context.colorScheme.onSurfaceVariant,
            color: backgroundColor ?? Color(0xFF8E0606),
            border: Border.all(color: borderColor ?? Colors.black)),
        width: width,
        child: AppTextStyle(
          text: title,
          fontSize: fontSize ?? 14.sp,
          color: Colors.white,
        ));
  }
}
