// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/app/app_theme/extension.dart';
import '/app/methods/app_text_style.dart';
import '../app_animation/animated_page_route.dart';

class AppGoToPage extends StatelessWidget {
//  final BuildContext context;
  final String message1;
  final String message2;
  final Widget page;
  final double? verticalMargin;
  final double? fontSize;
  const AppGoToPage({
    super.key,
    //required this.context,
    required this.message1,
    required this.message2,
    required this.page,
    this.verticalMargin,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: 10.w, vertical: verticalMargin ?? 0),
        alignment: Alignment.center,
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(AnimatedPageRoute.create(page: page));
              // Navigator.pushNamed(context, root);
            },
            child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              5.horizontalSpace,
              AppTextStyle(text: message1, fontSize: fontSize ?? 15),
              AppTextStyle(
                  text: message2,
                  fontSize: fontSize ?? 15,
                  color: context.colorScheme.onError)
            ])));
  }
}
