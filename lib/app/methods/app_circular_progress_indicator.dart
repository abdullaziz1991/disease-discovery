import '../app_theme/extension.dart';
import 'package:flutter/material.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                    color: context.colorScheme.errorContainer))));
  }
}
