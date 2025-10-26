// import 'package:animated_icon_button/animated_icon_button.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../features/all_product/presentation/all_product_bloc/all_product_bloc.dart';
// import '../../../features/all_product/presentation/all_product_bloc/all_product_event.dart';
// import '../../../features/all_product/presentation/all_product_bloc/all_product_state.dart';

// class AppDrawerChangeThemeMode extends StatelessWidget {
//   const AppDrawerChangeThemeMode({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //bool isDark = AppHive.theme == "DarkMode";
//     return BlocBuilder<AllProductBloc, AllProductState>(
//       builder: (context, state) {
//         return SizedBox(
//             height: 35.h,
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AnimatedIconButton(
//                       onPressed: () => context
//                           .read<AllProductBloc>()
//                           .add(ChangeThemeEvent()),
//                       icons: [
//                         AnimatedIconItem(
//                             icon: Icon(
//                                 state.isDark
//                                     ? Icons.light_mode
//                                     : Icons.dark_mode,
//                                 color: state.isDark
//                                     ? Colors.white
//                                     : Colors.black)),
//                       ]),
//                   IconButton(
//                       onPressed: () {
//                         if (context.locale.languageCode == 'en') {
//                           context.setLocale(const Locale('ar'));
//                         } else {
//                           context.setLocale(const Locale('en'));
//                         }
//                       },
//                       icon: Icon(Icons.language,
//                           color: state.isDark ? Colors.white : Colors.black))
//                 ]));
//       },
//     );
//   }
// }
