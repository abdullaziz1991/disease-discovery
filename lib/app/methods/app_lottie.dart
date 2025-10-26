// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottie extends StatelessWidget {
  final String lottie;
  final double height;
  final double width;
  const AppLottie(
      {super.key, required this.lottie, this.height = 200, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Lottie.asset(lottie,
            fit: BoxFit.cover, width: width, height: height));
  }
}
// / const AppLottie(lottie: 'Loading');