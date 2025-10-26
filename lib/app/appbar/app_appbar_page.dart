// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../core/app_colors/app_colors.dart';

class AppAppbarPage extends StatelessWidget {
  String title;
  double fontSize;
  FontWeight fontWeight;
  void Function()? onPressed;
  AppAppbarPage({
    super.key,
    required this.title,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(false)),
      const Spacer(),
      Text(title,
          style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              color: AppColors.textPrimary)),
      const Spacer()
    ]);
  }
}
