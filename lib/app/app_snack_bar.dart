import 'package:flutter/material.dart';

import '../presentation/widgets/app_text_style.dart';

class AppSnackBar {
  static void show(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Center(
          child: AppTextStyle(
        text: message,
        //color: context.colorScheme.surface,
        color: Colors.white,
      )),
      backgroundColor: Colors.black,
      // backgroundColor: context.colorScheme.onSurface,
    ));
  }
}
