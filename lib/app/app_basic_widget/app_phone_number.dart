// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '/app/app_theme/extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../core/strings/constants.dart';
import 'dart:ui' as ui;

class AppPhoneNumber extends StatefulWidget {
  PhoneNumber initialNumber;
  // PhoneNumber initialNumber;
  final ValueChanged<PhoneNumber> phoneNumber;
  final double? horizontalPadding;
  final double? verticalPadding;

  AppPhoneNumber({
    super.key,
    required this.phoneNumber,
    this.horizontalPadding,
    this.verticalPadding,
    required this.initialNumber,
    // required this.initialNumber
  });

  @override
  State<AppPhoneNumber> createState() => _AppPhoneNumberState();
}

class _AppPhoneNumberState extends State<AppPhoneNumber> {
  late PhoneNumber initialNumber;

  @override
  void initState() {
    initialNumber = widget.initialNumber;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding ?? 10,
          vertical: widget.verticalPadding ?? 0),
      child: Directionality(
        textDirection: ui.TextDirection.ltr, // ثبّت الاتجاه إلى اليسار لليمين
        child: InternationalPhoneNumberInput(
          autoFocus: false,
          countries: arabicCountryCodes,
          autoValidateMode: AutovalidateMode.onUserInteraction,
          onInputChanged: (PhoneNumber number) {
            initialNumber = number;
          },
          onInputValidated: (bool isValid) {
            print('Is number valid: $isValid');
            widget.phoneNumber(initialNumber);
          },
          selectorConfig: const SelectorConfig(
            showFlags: false,
            selectorType: PhoneInputSelectorType.DROPDOWN,
          ),
          ignoreBlank: false,
          initialValue: initialNumber,
          textFieldController: TextEditingController(),
          formatInput: true,
          inputDecoration: InputDecoration(
            labelText: "Phone Number".tr(),
            labelStyle: TextStyle(
              color: context.colorScheme.onSurface.withOpacity(.5),
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              fontFamily: "Figtree-Regular",
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );

    // Padding(
    //     padding: EdgeInsets.symmetric(
    //         horizontal: widget.horizontalPadding ?? 10,
    //         vertical: widget.verticalPadding ?? 0),
    //     child: InternationalPhoneNumberInput(
    //         autoFocus: false, //
    //         countries: arabicCountryCodes,
    //         // countries: countriesCodes, // مثال لدول محددة
    //         // autoValidateMode: AutovalidateMode.disabled,
    //         autoValidateMode: AutovalidateMode.onUserInteraction,
    //         onInputChanged: (PhoneNumber number) {
    //           // print(number.phoneNumber); // الرقم النهائي
    //           initialNumber = number;
    //           // print(number.isoCode);
    //         },
    //         onInputValidated: (bool isValid) {
    //           print('Is number valid: $isValid');
    //           widget.phoneNumber(initialNumber);
    //         },
    //         selectorConfig: const SelectorConfig(
    //             showFlags: false, // إخفاء الأعلام
    //             selectorType: PhoneInputSelectorType.DROPDOWN),
    //         ignoreBlank: false,
    //         initialValue: initialNumber,
    //         textFieldController: TextEditingController(),
    //         formatInput: true,
    //         inputDecoration: InputDecoration(
    //             labelText: "Phone Number".tr(),
    //             labelStyle: TextStyle(
    //                 color: context.colorScheme.onSurface.withOpacity(.5),
    //                 fontSize: 12.sp,
    //                 fontWeight: FontWeight.bold,
    //                 fontFamily: "Figtree-Regular"),
    //             border: const OutlineInputBorder())));
  }
}
