import 'package:disease_discovery_project/app/home.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../app/app_button.dart';
import '../widgets/initial_page/app_bottom_image.dart';
import '../widgets/initial_page/app_top_image.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = ScreenUtil().screenHeight;
    return Scaffold(
        body: Stack(children: [
      Image.asset("assets/images/background.jpg",
          fit: BoxFit.fill, height: height),
      const AppTopImage(),
      AppBottomImage(height: height),
      Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset("assets/animation/doctor.json",
            fit: BoxFit.cover, height: 250, width: 250),
        10.verticalSpace,
        InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child:
                AppButton(title: "Medical Diagnostic App".tr(), width: 220.w)),
      ]))
    ]));
  }
}
