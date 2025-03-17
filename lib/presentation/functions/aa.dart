
// import 'package:google_ml_kit/google_ml_kit.dart';

// void startListening() async {
//   final speechRecognizer = GoogleMlKit.instance.speechRecognizer();

//   // بدء التسجيل
//   speechRecognizer.listen(
//     onResult: (result) {
//       print("النص المعترف به: ${result.text}");
//     },
//     onError: (error) {
//       print("خطأ: $error");
//     },
//     localeId: 'ar-EG', // للغة العربية
//   );
// }

// void stopListening() {
//   speechRecognizer.stop();
// }