// import '../app_theme/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../methods/app_go_to_page.dart';

// class AppCheckbox extends StatefulWidget {
//   final String label; // النص بجانب الـ Checkbox
//   final ValueChanged<bool> onChanged; // استدعاء عند تغيير الحالة
//   final bool initialValue; // القيمة الابتدائية

//   const AppCheckbox(
//       {super.key,
//       required this.label,
//       required this.onChanged,
//       this.initialValue = false});

//   @override
//   _AppCheckboxState createState() => _AppCheckboxState();
// }

// class _AppCheckboxState extends State<AppCheckbox> {
//   late bool isChecked;

//   @override
//   void initState() {
//     super.initState();
//     isChecked = widget.initialValue; // تعيين القيمة الابتدائية
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(children: [
//       Checkbox(
//         value: isChecked,
//         onChanged: (value) {
//           setState(() {
//             isChecked = value!;
//           });
//           widget.onChanged(isChecked); // إبلاغ القيم الجديدة إلى المستخدم
//         },
//         checkColor:
//             context.colorScheme.onSecondary, // تغيير لون إشارة الصح إلى الأبيض
//         activeColor: context.colorScheme.primary,
//         // لون خلفية الـ Checkbox عند التحديد (يمكنك تغييره)
//       ),
//       AppGoToPage(
//           message1: widget.label,
//           message2: "",
//           page: const PrivacyPolicy(),
//           verticalMargin: 3,
//           fontSize: 11.sp),
//     ]);
//   }
// }
