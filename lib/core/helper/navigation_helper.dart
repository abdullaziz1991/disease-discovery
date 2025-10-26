import 'package:flutter/material.dart';

class NavigationHelper {
  static void pop(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  static void popTwice(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context)
        ..pop()
        ..pop();
    }
  }

  static Future<void> push(BuildContext context, Widget page) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<void> pushReplacement(BuildContext context, Widget page) async {
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }

  static Future<void> popAndPushReplacement(
      BuildContext context, Widget page) async {
    pop(context);
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static Future<void> popAndPush(BuildContext context, Widget page) async {
    pop(context);
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
