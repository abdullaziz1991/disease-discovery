import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../features/diseases_discovery/presentation/bloc/diseases_discovery_bloc.dart';
import '../features/diseases_discovery/presentation/pages/initial_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // String x = true;
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => GetIt.I<DiseasesDiscoveryBloc>()),
        ],
        child: ScreenUtilInit(
            designSize: const Size(411, 843),
            minTextAdapt: false,
            splitScreenMode: true,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Shopping App',
              themeMode: ThemeMode.light,
              home: const InitialPage(),
            )));
  }
}
