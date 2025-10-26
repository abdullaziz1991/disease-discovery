import 'package:disease_discovery_project/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/diseases_discovery/presentation/functions/permission.dart';

// FVM (Flutter Version Manager) – لإدارة إصدارات Flutter بسهولة.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // هي دالة تُستخدم في تطبيقات Flutter لضمان تهيئة Flutter engine
  //قبل تشغيل أي عمليات تتطلب التفاعل مع محرك Flutter أو منصة التشغيل
  //(مثل الوصول إلى الملفات، تشغيل خدمات،  plugins، إلخ).
  await EasyLocalization.ensureInitialized();
  // تهيئة الترجمة
  EasyLocalization.logger.enableLevels = []; // إلغاء التحذيرات
  requestMicrophonePermission();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    fallbackLocale: const Locale('ar'),
    useOnlyLangCode: true,
    // التطبيق سيستخدم رمز اللغة فقط (language code) دون تضمين رمز الدولة (country code).
    // اي يكفي Locale('en') ولا حاجة ل Locale('en', 'US')
    saveLocale: true,
    // يقوم EasyLocalization بحفظ اللغة التي اختارها المستخدم، بحيث يتم استعادتها تلقائيًا عند تشغيل التطبيق مرة أخرى، بدلاً من إعادة تعيينها إلى اللغة الافتراضية
    child: const MyApp(),
    // الواجهة الاساسية للتطبيق
  ));
}

// cd prodiction 
// python app.py
