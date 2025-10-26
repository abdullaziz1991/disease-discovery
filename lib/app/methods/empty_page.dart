// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import '/app/app_theme/extension.dart';
// import 'app_text_style.dart';

// class EmptyPage extends StatelessWidget {
//   final String message;
//   final bool? floatingVisibility;
//   const EmptyPage({super.key, required this.message, this.floatingVisibility});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         floatingActionButton: Visibility(
//             visible: floatingVisibility ?? false,
//             child: ProductFloatingActionButton(context: context)),
//         body: Center(
//             child: AppTextStyle(
//                 text: message,
//                 fontSize: 18,
//                 color: context.colorScheme.onSurface)));
//   }
// }
