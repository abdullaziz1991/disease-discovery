// ignore_for_file: public_member_api_docs, sort_constructors_first

import '/app/app_theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextStyle extends StatelessWidget {
  String text;
  String? fontFamily;
  double? fontSize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? textAlign;
  int? maxLines;

  AppTextStyle({
    super.key,
    required this.text,
    //this.fontFamily = 'VariableFont_wght',
    this.fontFamily = "Figtree-Regular",
    double? fontSize, //
    this.fontWeight = FontWeight.bold,
    this.color,
    this.textAlign = TextAlign.start,
    this.maxLines,
  }) : fontSize = fontSize ?? 14;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color ?? context.colorScheme.onSurface,
            overflow: TextOverflow.visible),
        maxLines: maxLines ?? 1000, // تحديد الحد الأقصى لعدد السطور
        overflow: TextOverflow.ellipsis,
        // softWrap: true,
        // السماح بالنقل إلى سطر جديد إذا كانت المساحة غير كافية
        textAlign: textAlign);
  }
}
