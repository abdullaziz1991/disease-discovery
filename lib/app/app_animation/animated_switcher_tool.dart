// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class AnimatedSwitcherTool extends StatelessWidget {
  final Widget child;
  const AnimatedSwitcherTool({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 700), // مدة الحركة
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
              opacity: animation, // حركة تلاشي
              child: child);
        },
        child: child);
  }
}
