import '../app_theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DividerContainer extends StatelessWidget {
  final double? padding;
  final double? height;
  const DividerContainer({super.key, this.padding, this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: padding ?? 0), //, vertical: 10
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Container(
                  height: height ?? 7.h, color: context.colorScheme.primary)),
          Expanded(
              flex: 2,
              child: Container(
                  height: height ?? 7.h, color: context.colorScheme.onTertiary))
        ]));
  }
}
