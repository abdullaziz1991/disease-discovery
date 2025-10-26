// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import '../../features/authentication/data/models/Personal_data_model.dart';
// import '../api/api_routes.dart';
// import '../methods/app_text_style.dart';

// class AppDrawerUserHeader extends StatelessWidget {
//   final PersonalData? personalData;
//   const AppDrawerUserHeader({super.key, this.personalData});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         child: UserAccountsDrawerHeader(
//             decoration:
//                 BoxDecoration(color: Theme.of(context).colorScheme.primary),
//             currentAccountPicture: CircleAvatar(
//                 radius: 50.0,
//                 backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                 backgroundImage:
//                     NetworkImage(ApiRoutes.image.userImageUrL + personalData!.userImage!)),
//             accountEmail: AppTextStyle(text: personalData!.userEmail!),
//             accountName: AppTextStyle(text: personalData!.userName!)),
//         onTap: () {});
//   }
// }
