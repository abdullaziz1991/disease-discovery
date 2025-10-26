import '../methods/app_text_style.dart';
import '../app_theme/extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AddSlider extends StatefulWidget {
  int sliderNumber;
  final ValueChanged<int> level;
  AddSlider({
    super.key,
    required this.sliderNumber,
    required this.level,
  });

  @override
  State<AddSlider> createState() => _AddSliderState();
}

class _AddSliderState extends State<AddSlider> {
  @override
  Widget build(BuildContext context) {
    double width = ScreenUtil().screenWidth;
    return Container(
        width: width - 20,
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        margin: EdgeInsets.only(top: 10.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 1.w, color: context.colorScheme.primary)),
        child: Row(children: [
          Icon(Icons.tune, color: Colors.orange, size: 27.r),
          Expanded(
              child: Column(children: [
            8.verticalSpace,
            AppTextStyle(
                text: "${"Quality level : ".tr()}${widget.sliderNumber} %",
                fontSize: 13.sp,
                color: context.colorScheme.onSurface,
                fontFamily: "notoKufi"),
            5.verticalSpace,
            SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.white,
                  thumbShape:
                      const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape:
                      const RoundSliderOverlayShape(overlayRadius: 13.0),
                ),
                child: Slider(
                    value: widget.sliderNumber.toDouble(),
                    min: 1.0,
                    max: 100.0,
                    activeColor:context.colorScheme.primary,
                    //activeColor: Colors.black.withOpacity(0.5),
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double newValue) {
                      setState(() {
                        widget.level(newValue.round());
                        widget.sliderNumber = newValue.round();
                      });
                    }))
          ]))
        ]));
  }
}
