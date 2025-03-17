import 'package:disease_discovery_project/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/functions/permission.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // هي دالة تُستخدم في تطبيقات Flutter لضمان تهيئة Flutter engine
  //قبل تشغيل أي عمليات تتطلب التفاعل مع محرك Flutter أو منصة التشغيل
  //(مثل الوصول إلى الملفات، تشغيل خدمات،  plugins، إلخ).
  await EasyLocalization.ensureInitialized();
  // تهيئة الترجمة
  EasyLocalization.logger.enableLevels = []; // إلغاء التحذيرات
  requestMicrophonePermission();

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

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

// import 'bloc/calculator_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: BlocProvider(
//         create: (context) => CalculatorBloc(),
//         child: CalculatorScreen(),
//       ),
//     );
//   }
// }

// class CalculatorScreen extends StatefulWidget {
//   @override
//   _CalculatorScreenState createState() => _CalculatorScreenState();
// }

// class _CalculatorScreenState extends State<CalculatorScreen> {
//   final TextEditingController num1Controller = TextEditingController();
//   final TextEditingController num2Controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Flutter Bloc Calculator')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: num1Controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter first number'),
//             ),
//             TextField(
//               controller: num2Controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(labelText: 'Enter second number'),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     String a = "abc";
//                     bool b = false;
//                     int n = 10;
//                     int num1 = int.tryParse(num1Controller.text) ?? 0;
//                     int num2 = int.tryParse(num2Controller.text) ?? 0;
//                     context.read<CalculatorBloc>().add(AddNumbers(num1, num2));
//                   },
//                   child: Text('Add'),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // setState(() {

//                     // });
//                     int num1 = int.tryParse(num1Controller.text) ?? 0;
//                     int num2 = int.tryParse(num2Controller.text) ?? 0;
//                     context
//                         .read<CalculatorBloc>()
//                         .add(SubtractNumbers(num1, num2));
//                   },
//                   child: Text('Subtract'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             BlocBuilder<CalculatorBloc, CalculatorState>(
//               builder: (context, state) {
//                 return Text(
//                   'Result: ${state.result}',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
