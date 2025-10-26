import 'package:disease_discovery_project/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/diseases_discovery/presentation/functions/permission.dart';

// FVM (Flutter Version Manager) – لإدارة إصدارات Flutter بسهولة.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableLevels = []; // إلغاء التحذيرات
  requestMicrophonePermission();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ar'),
    useOnlyLangCode: true,
    saveLocale: true,
    child: const MyApp(),
  ));
}

// cd prodiction 
// python app.py
