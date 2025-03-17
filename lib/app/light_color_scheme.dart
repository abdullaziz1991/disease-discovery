import 'package:flutter/material.dart';

//   color: context.colorScheme.onSurface.withOpacity(.8),
const lightColorScheme = ColorScheme.light(
  primary: Color(0xFF1C1E53),
  onPrimary: Color(0xFF1C1E53), //primary.withopacity(.5)
  //Color(0xFFFAAC01)
  primaryContainer: Color(0xffFAF2EF),
  onPrimaryContainer: Color(0xffFAF2EF),
  //onPrimaryContainer: Color(0xffF7F7F7),
  //
  secondary: Color(0xFF000000),
  onSecondary: Color(0xFFFFFFFF),
  //
  // tertiary: Color(0xff2814A7),
  tertiary: Color.fromARGB(255, 26, 23, 226),
  onTertiary: Color(0xFFFFC107), // amber
//
  inverseSurface: Color(0xFF677294),
  onInverseSurface: Color(0xFF979797), //Colors.pink,
  //
  errorContainer: Color(0xFF8E0606),
  onErrorContainer: Color(0xFF410E0B),
  //
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
  //
  onSurfaceVariant: Color(0xFFFF9800), // orange
  outline: Color(0xFF0B2C66),
  shadow: Color(0xFFF7F7F7),
  //
  error: Color(0xFFF44336),
  onError: Color(0xFF432465),
);

extension ColorExtension on Color {
  Color? get getOnColor {
    switch (value) {
      case 0xFFFB5607:
        return lightColorScheme.onPrimary;
      case 0xFFF3F3F3:
        return const Color(0xff023047);
      default:
        return null;
    }
  }
}
// Color.fromARGB(255, 174, 226, 63)