import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/diseases_discovery/presentation/bloc/diseases_discovery_bloc.dart';
import '../features/diseases_discovery/presentation/pages/initial_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // String x = true;
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => DiseasesDiscoveryBloc()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(411, 843),
            minTextAdapt: false,
            // لتحديد ما إذا كان سيتم تكييف النصوص تلقائيًا مع حجم الشاشة الأصغر
            splitScreenMode: true,
            //  التطبيق سيتكيف تلقائيًا مع تغييرات حجم النافذة عند تشغيله في وضع تقسيم الشاشة أو عند تغيير حجم النافذة.
            //  يتم إعادة حساب القياسات تلقائيًا بناءً على الحجم الجديد للنافذة عند تغيير الأبعاد.
            //  يضمن توافق التصميم مع الأجهزة اللوحية وأوضاع النوافذ المتعددة.
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              // تحميل بيانات الترجمة
              supportedLocales: context.supportedLocales,
              // هي خاصية تُستخدم لتحديد اللغات التي يدعمها التطبيق
              locale: context.locale,
              // لتحديد اللغة والمنطقة الحالية
              title: 'Shopping App',
              themeMode: ThemeMode.light,
              home: const InitialPage(),
              // الصفحة الرئيسية للتطبيق
            )));
  }
}
              // localizationsDelegates: EasyLocalization.of(context)!.delegates,
              // supportedLocales: EasyLocalization.of(context)!.supportedLocales,
              // locale: EasyLocalization.of(context)!.locale,