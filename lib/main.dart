import 'package:disease_discovery_project/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'presentation/functions/permission.dart';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: TtsScreen(),
//     );
//   }
// }

// class TtsScreen extends StatefulWidget {
//   @override
//   _TtsScreenState createState() => _TtsScreenState();
// }

// class _TtsScreenState extends State<TtsScreen> {
//   final FlutterTts flutterTts = FlutterTts();
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _initTts();
//   }

//   Future<void> _initTts() async {
//     await flutterTts.setLanguage("en-US");

//     // await flutterTts.setLanguage("ar-SA"); // تهيئة اللغة
//   }

//   Future<void> _speak() async {
//     await flutterTts.speak(_controller.text);
//   }

//   Future<void> _stop() async {
//     await flutterTts.stop();
//   }

//   @override
//   void dispose() {
//     flutterTts.stop();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('محول النص إلى كلام')),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: InputDecoration(
//                 labelText: 'أدخل النص هنا',
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _speak,
//                   child: Text('تشغيل'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _stop,
//                   child: Text('إيقاف'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


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
