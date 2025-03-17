import 'package:flutter/material.dart';

extension ColorSchemeExtension on ColorScheme {
  Color get containerColor => shadowContainerColor(0.16);

  Color get backGroundIcon =>
      getColor(light: const Color(0xff1C1B1B), dark: const Color(0xff1C1B1B));

  Color get commentColor =>
      getColor(light: const Color(0xffFAF2EF), dark: const Color(0xFF101010));

  Color get pendingColor =>
      getColor(light: const Color(0xff9F0AE5), dark: const Color(0xff9F0AE5));
  Color get greenColor =>
      getColor(light: const Color(0xff00AB11), dark: const Color(0xff00AB11));
  Color get redColor => getColor(
      light: const Color.fromARGB(255, 255, 23, 7),
      dark: const Color.fromARGB(255, 255, 23, 7));
  Color get textFieldColor =>
      getColor(light: const Color(0xffF6F6F6), dark: const Color(0xffF6F6F6));

  Color get profileTextColor =>
      getColor(light: const Color(0xffB0B0B0), dark: const Color(0xffB0B0B0));

  Color get borderColor =>
      getColor(light: const Color(0xffC7C7C7), dark: const Color(0xffC7C7C7));

  Color get backgroundColor =>
      getColor(light: const Color(0xffF0F0F0), dark: const Color(0xffF0F0F0));

  Color get offWhiteColor =>
      getColor(light: const Color(0xffF9F9F9), dark: const Color(0xffF9F9F9));

  Color get searchTextFieldColor =>
      getColor(light: const Color(0xFFEDEDED), dark: const Color(0xFFEDEDED));

  Color get switchColor =>
      getColor(light: const Color(0xFF51D25C), dark: const Color(0xFF51D25C));

  Color get textColor =>
      getColor(light: const Color(0xFF2D2C2C), dark: const Color(0xFF2D2C2C));

  Color get underlineTextColor =>
      getColor(light: const Color(0xff024A22), dark: const Color(0xff024A22));

  Color get border1 => getColor(
      light: const Color.fromARGB(65, 228, 228, 228),
      dark: const Color.fromARGB(65, 228, 228, 228));

  Color get border => getColor(
      light: const Color.fromARGB(51, 255, 255, 255),
      dark: const Color.fromARGB(51, 255, 255, 255));

// Notification

  Color get notificationTitle =>
      getColor(light: const Color(0xff0D0D0D), dark: const Color(0xff0D0D0D));

  Color get notificationDate =>
      getColor(light: const Color(0xff222222), dark: const Color(0xff222222));

  MaterialColor get systemGray => const MaterialColor(
        0xff667085,
        <int, Color>{
          25: Color(0xffFCFCFD),
          50: Color(0xffF9FAFB),
          100: Color(0xffF2F4F7),
          200: Color(0xffEAECF0),
          300: Color(0xffD0D5DD),
          400: Color(0xff98A2B3),
          500: Color(0xff667085),
          600: Color(0xff475467),
          700: Color(0xff344054),
          800: Color(0xff1D2939),
          900: Color(0xff101828),
        },
      );

  MaterialColor get systemSuccess => const MaterialColor(
        0xff12B76A,
        <int, Color>{
          25: Color(0xffF6FEF9),
          50: Color(0xffECFDF3),
          100: Color(0xffD1FADF),
          200: Color(0xffA6F4C5),
          300: Color(0xff6CE9A6),
          400: Color(0xff32D583),
          500: Color(0xff12B76A),
          600: Color(0xff039855),
          700: Color(0xff027A48),
          800: Color(0xff05603A),
          900: Color(0xff05603A),
        },
      );

  get systemError => const MaterialColor(
        0xffF04438,
        <int, Color>{
          25: Color(0xffFFFBFA),
          50: Color(0xffFEF3F2),
          100: Color(0xffFEE4E2),
          200: Color(0xffFECDCA),
          300: Color(0xffFDA29B),
          400: Color(0xffF97066),
          500: Color(0xffF04438),
          600: Color(0xffD92D20),
          700: Color(0xffB42318),
          800: Color(0xff912018),
          900: Color(0xff912018),
        },
      );

  MaterialColor get brandPrimary => const MaterialColor(
        0xffBC4105,
        <int, Color>{
          25: Color(0xffFFF3EE),
          50: Color(0xffFEE6DA),
          100: Color(0xffFECBB2),
          200: Color(0xffFB5607),
          300: Color(0xffE24D06),
          400: Color(0xffC94506),
          500: Color(0xffBC4105),
          600: Color(0xff973404),
          700: Color(0xff712703),
          800: Color(0xff581E02),
        },
      );

  MaterialColor get brandAccent => const MaterialColor(
        0xff222636,
        <int, Color>{
          50: Color(0xffF0F0F5),
          100: Color(0xffBEC0C9),
          200: Color(0xff8D8F9C),
          300: Color(0xff5C5E6F),
          400: Color(0xff2B2D42),
          500: Color(0xff222636),
          600: Color(0xff1A1D29),
          700: Color(0xff12141C),
          800: Color(0xff0A0B0F),
        },
      );

  Color shadowContainerColor(double opacity) {
    return getColor(
      light: Color.fromRGBO(191, 191, 191, opacity),
      dark: Color.fromRGBO(191, 191, 191, opacity),
    );
  }

  ///restaurant
  Color shadowCard1(double opacity) {
    return getColor(
      light: Color.fromRGBO(0, 0, 0, opacity),
      dark: Color.fromRGBO(0, 0, 0, opacity),
    );
  }

  Color shadowCard2(double opacity) {
    return getColor(
        light: Color.fromRGBO(33, 165, 105, opacity),
        dark: Color.fromRGBO(33, 165, 105, opacity));
  }

  Color shadowCard3(double opacity) {
    return getColor(
        light: Color.fromRGBO(255, 255, 255, opacity),
        dark: Color.fromRGBO(255, 255, 255, opacity));
  }

  Color shadowCard4(double opacity) {
    return getColor(
        light: Color.fromRGBO(251, 103, 33, opacity),
        dark: Color.fromRGBO(251, 103, 33, opacity));
  }

  ///Helper Method
  Color getColor({required Color light, required Color dark}) =>
      brightness == Brightness.light ? light : dark;
}

extension FFF on MaterialColor {
  Color get shade25 => this[25]!;
}
