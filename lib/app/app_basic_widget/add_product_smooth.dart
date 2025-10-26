// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AddProductSmooth extends StatelessWidget {
final  PageController pageController;
  const AddProductSmooth({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:  EdgeInsets.only(top: 16.h),
        child: SmoothPageIndicator(
            controller: pageController,
            count: 2,
            effect:  SwapEffect(
                activeDotColor: Colors.blue,
                dotColor: Colors.grey,
                dotHeight: 10.h,
                dotWidth: 10.w,
                spacing: 8)));
  }
}
