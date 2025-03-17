
// <uses-permission android:name="android.permission.RECORD_AUDIO"/>
// <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION"/>

import 'package:permission_handler/permission_handler.dart';

void requestMicrophonePermission() async {
  var status = await Permission.microphone.request();
  if (status.isGranted) {
    print('تم منح صلاحية الميكروفون');
  } else if (status.isDenied) {
    print('تم رفض صلاحية الميكروفون');
  } else if (status.isPermanentlyDenied) {
    // إذا رفض المستخدم الصلاحية بشكل دائم، يمكن توجيهه إلى الإعدادات
    openAppSettings();
  }
}