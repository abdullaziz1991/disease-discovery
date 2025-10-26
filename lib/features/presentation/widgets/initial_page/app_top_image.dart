import 'package:flutter/material.dart';

class AppTopImage extends StatelessWidget {
  final double? opacity;
  const AppTopImage({super.key, this.opacity});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: opacity ?? 1,
        child: Container(
            alignment: Alignment.topRight,
            child: Image.asset(
              "assets/images/background_Top.png",
              width: double.infinity,
            )));
  }
}
