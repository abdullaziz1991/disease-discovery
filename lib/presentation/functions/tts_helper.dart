import 'package:flutter_tts/flutter_tts.dart';

// إنشاء كائن من FlutterTts
FlutterTts flutterTts = FlutterTts();

// دالة لتحويل النص إلى كلام
Future<void> speak(String text) async {
  await flutterTts.setLanguage("en-US");
  //await flutterTts.setLanguage("ar-EG"); // العربية - مصر
  await flutterTts.setPitch(1.0); // مستوى الصوت (1.0 عادي)
  await flutterTts.speak(text); // تشغيل النص
  await flutterTts.setSpeechRate(0.5); // سرعة القراءة
  // تغيير الصوت إلى صوت رجل (اختر صوتًا من `getVoices`)
 // await flutterTts.setVoice({"name": "hi-IN-SMTf00", "locale": "hin"});
//   List<dynamic> voices = await flutterTts.getVoices;
// print("الأصوات المتاحة: $voices");
}

// دالة لإيقاف الكلام
Future<void> stop() async {
  await flutterTts.stop();
}

Future<void> speakAdvices(List<String> advices) async {
  for (int i = 0; i < advices.length; i++) {
    await flutterTts.speak(advices[i]);
    await Future.delayed(Duration(seconds: 2)); // وقت انتظار إضافي
    await waitForSpeechCompletion();
  }
}

Future<void> waitForSpeechCompletion() async {
  bool isSpeaking = true;
  flutterTts.setCompletionHandler(() {
    isSpeaking = false;
  });

  while (isSpeaking) {
    await Future.delayed(Duration(milliseconds: 500));
  }
}
