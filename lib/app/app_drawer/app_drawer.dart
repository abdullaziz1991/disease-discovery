// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../features/auth/data/models/Personal_data_model.dart';
// import '../../../../features/auth/presentation/pages/sign_in_screen.dart';
// import '../../../../services/app_hive.dart';
// import '../../util/least_used/divider_container.dart';
// import '../../most_used/app_text_style.dart';
// import 'app_drawer_user_header.dart';

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     PersonalData? personalData = AppHive.personalData;
//     return Drawer(
//         child: Column(children: [
//       SingleChildScrollView(
//           child: Column(children: [
//         AppDrawerUserHeader(personalData: personalData),
//         const DividerContainer(),
//         // const AppDrawerChangeThemeMode(),
//         drawerItem(Icons.logout, "Sign Out".tr(), context, ""),
//       ]))
//     ]));
//   }
// }

// ListTile drawerItem(IconData iconItem, String title, context, String root) {
//   return ListTile(
//       onTap: () async {
//         if (root != "") {
//           Navigator.of(context).pushReplacementNamed(root);
//         } else {
//           AppHive.clearData();
//           Navigator.pushReplacementNamed(context, SignInScreen.screenRoute);
//         }
//       },
//       leading: Icon(iconItem, size: 28.r, color: Colors.red),
//       title: AppTextStyle(text: title, fontSize: 16.sp));
// }
