// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../api/local_images_path.dart';
import 'app_lottie.dart';
class WidgetOrLottie extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final double? transparency;
  const WidgetOrLottie(
      {super.key,
      required this.child,
      required this.isLoading,
      this.transparency});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      child,
      if (isLoading)
        Container(
            color: Colors.black.withOpacity(transparency ?? 0.3),
            child: AppLottie(lottie: ImagesPath.lottie.loadingCircleCheckRed))
    ]);
  }
}
