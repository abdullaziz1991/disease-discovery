// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppBottomImage extends StatelessWidget {
  final double? opacity;
  final double height;
  const AppBottomImage({super.key, this.opacity, required this.height});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacity ?? 1,
        child: Container(
            alignment: Alignment.bottomLeft,
            height: height,
            width: double.infinity,
            child: Image.asset(
              "assets/images/background_Bottom.png",
              width: double.infinity,
            )));
  }
}
