// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/app/app_theme/extension.dart';
import '/app/methods/app_text_style.dart';
import '../../core/strings/countries_and_cities.dart';

// class AppDropdownSelectCountry extends StatefulWidget {
//   final ValueChanged<List<int>> itemIndex;
//   final String initialCountryValue;
//   final String initialCityValue;
//   const AppDropdownSelectCountry({
//     super.key,
//     required this.itemIndex,
//     required this.initialCountryValue,
//     required this.initialCityValue,
//   });

//   @override
//   _AppDropdownSelectCountryState createState() =>
//       _AppDropdownSelectCountryState();
// }

// class _AppDropdownSelectCountryState extends State<AppDropdownSelectCountry> {
//   String? selectedCountry;
//   String? initialCountryValue;
//   int selectedCountryIndex = 0;

//   List<String> list2 = [];
//   List<String> cityList = [];
//   @override
//   void didChangeDependencies() {
//     selectedCountry = widget.initialCountryValue;
//     initialCountryValue = widget.initialCountryValue;
//     for (int i = 0; i < allCountries.keys.length; i++) {
//       list2.add(allCountries.keys.toList()[i].tr());
//     }
//     super.didChangeDependencies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     widget.initialCountryValue == "Saudi Arabia"
//         ? selectedCountry = "Saudi Arabia"
//         : null;

//     return Container(
//         //   height: 60.h,
//         padding: EdgeInsets.symmetric(horizontal: 8.w),
//         margin: EdgeInsets.symmetric(horizontal: 10.w),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.r),
//           border: Border.all(width: 1.w, color: context.colorScheme.primary),
//         ),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           10.verticalSpace,
//           Row(children: [
//             Icon(Icons.location_on, color: Colors.orange, size: 27.r),
//             10.horizontalSpace,
//             Expanded(
//                 flex: 2,
//                 child: AppTextStyle(
//                     text: "Select a Country :".tr(),
//                     fontSize: 12.sp,
//                     color: context.colorScheme.onSurface)),
//             Expanded(
//                 flex: 3,
//                 child: DropdownButton<String>(
//                     isExpanded: true,
//                     value: widget.initialCountryValue.tr(),
//                     items: allCountries.keys.map((String item) {
//                       return DropdownMenuItem<String>(
//                           alignment: AlignmentDirectional.center,
//                           value: item.tr(),
//                           child: AppTextStyle(
//                               text: item.tr(),
//                               fontSize: 12.sp,
//                               color: context.colorScheme.onSurface));
//                     }).toList(),
//                     onChanged: (String? country) {
//                       // selectedCity = null; // Reset city when country changes
//                       // selectedCountryIndex =
//                       //     allCountries.keys.toList().indexOf(country!);
//                       selectedCountryIndex = list2.indexOf(country!);
//                       widget.itemIndex([selectedCountryIndex, 0]);
//                       cityList = [];
//                       List<String> countryKeys = allCountries.keys.toList();
//                       String targetCountry = countryKeys[selectedCountryIndex];
//                       List<String>? cities = allCountries[targetCountry];
//                       for (int i = 0; i < cities!.length; i++) {
//                         cityList.add(cities![i].tr());
//                       }
//                       selectedCountry = targetCountry;
//                       print(selectedCountry);
//                       print(cityList);
//                       print("selectedCountry ------------------------");
//                     }))
//           ]),
//           5.verticalSpace,
//           //  if (selectedCountry != null) ...[
//           Row(children: [
//             Icon(Icons.gps_fixed, color: Colors.orange, size: 27.r),
//             10.horizontalSpace,
//             Expanded(
//                 flex: 2,
//                 child: AppTextStyle(
//                     text: "Select a City :".tr(),
//                     fontSize: 12.sp,
//                     color: context.colorScheme.onSurface)),
//             Expanded(
//                 flex: 3,
//                 child: DropdownButton<String>(
//                     isExpanded: true,
//                     value: widget.initialCityValue.tr(),
//                     items: allCountries[selectedCountry]!.map((String item) {
//                       return DropdownMenuItem<String>(
//                           alignment: AlignmentDirectional.center,
//                           value: item.tr(),
//                           child: AppTextStyle(
//                               text: item.tr(),
//                               fontSize: 12.sp,
//                               color: context.colorScheme.onSurface));
//                     }).toList(),
//                     onChanged: (String? city) {
//                       widget.itemIndex([
//                         selectedCountryIndex,
//                         cityList.indexOf(city!.tr()!)
//                       ]);
//                     }))
//           ]),
//           5.verticalSpace,
//           // ]
//         ]));
//   }
// }

class AppDropdownSelectCountry extends StatefulWidget {
  final ValueChanged<List<int>> itemIndex;
  final String initialCountryValue;
  final String initialCityValue;
  const AppDropdownSelectCountry({
    super.key,
    required this.itemIndex,
    required this.initialCountryValue,
    required this.initialCityValue,
  });

  @override
  _AppDropdownSelectCountryState createState() =>
      _AppDropdownSelectCountryState();
}

class _AppDropdownSelectCountryState extends State<AppDropdownSelectCountry> {
  String? selectedCity;
  String? selectedCountry;
  String? initialCountryValue;
  int selectedCountryIndex = 0;

  List<String> list2 = [];
  List<String> cityList = [];

  // @override
  // void didChangeDependencies() {
  //   selectedCountry = widget.initialCountryValue;
  //   initialCountryValue = widget.initialCountryValue;
  //   for (int i = 0; i < allCountries.keys.length; i++) {
  //     list2.add(allCountries.keys.toList()[i].tr());
  //   }
  //   super.didChangeDependencies();
  // }

// في initState أو didChangeDependencies
  @override
  void didChangeDependencies() {
    selectedCountry = widget.initialCountryValue;
    selectedCity = widget.initialCityValue; // <-- أضف هذا

    initialCountryValue = widget.initialCountryValue;

    for (int i = 0; i < allCountries.keys.length; i++) {
      list2.add(allCountries.keys.toList()[i].tr());
    }

    // إعداد القائمة الأولية للمدن
    List<String>? cities = allCountries[selectedCountry];
    if (cities != null) {
      cityList = cities.map((e) => e.tr()).toList();

      // ✅ تحقق أن المدينة موجودة، وإلا اختر أول واحدة
      if (!cities.contains(selectedCity)) {
        selectedCity = cities[0];
      }
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    widget.initialCountryValue == "Saudi Arabia"
        ? selectedCountry = "Saudi Arabia"
        : null;

    return Container(
        //   height: 60.h,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        margin: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: context.colorScheme.primary),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          10.verticalSpace,
          Row(children: [
            Icon(Icons.location_on, color: Colors.orange, size: 27.r),
            10.horizontalSpace,
            Expanded(
                flex: 2,
                child: AppTextStyle(
                    text: "Select a Country :".tr(),
                    fontSize: 12.sp,
                    color: context.colorScheme.onSurface)),
            Expanded(
                flex: 3,
                child: DropdownButton<String>(
                    isExpanded: true,
                    value: widget.initialCountryValue.tr(),
                    items: allCountries.keys.map((String item) {
                      return DropdownMenuItem<String>(
                          alignment: AlignmentDirectional.center,
                          value: item.tr(),
                          child: AppTextStyle(
                              text: item.tr(),
                              fontSize: 12.sp,
                              color: context.colorScheme.onSurface));
                    }).toList(),
                    onChanged: (String? country) {
                      selectedCountryIndex =
                          allCountries.keys.toList().indexOf(country!);
                      String targetCountry = country;

                      // إعداد المدينة الأولى من الدولة الجديدة
                      List<String>? cities = allCountries[targetCountry];
                      selectedCity = cities != null && cities.isNotEmpty
                          ? cities[0]
                          : null;

                      // تحديث الدولة والمدينة
                      setState(() {
                        selectedCountry = targetCountry;
                      });

                      widget.itemIndex([
                        selectedCountryIndex,
                        0, // المدينة الأولى
                      ]);
                    }))
          ]),
          5.verticalSpace,
          //  if (selectedCountry != null) ...[
          Row(children: [
            Icon(Icons.gps_fixed, color: Colors.orange, size: 27.r),
            10.horizontalSpace,
            Expanded(
                flex: 2,
                child: AppTextStyle(
                    text: "Select a City :".tr(),
                    fontSize: 12.sp,
                    color: context.colorScheme.onSurface)),
            Expanded(
                flex: 3,
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedCity, // ✅ لا تستخدم .tr()
                  items: allCountries[selectedCountry]!.map((String item) {
                    return DropdownMenuItem<String>(
                      alignment: AlignmentDirectional.center,
                      value: item, // القيمة الأصلية
                      child: AppTextStyle(
                        text: item.tr(), // فقط العرض مترجم
                        fontSize: 12.sp,
                        color: context.colorScheme.onSurface,
                      ),
                    );
                  }).toList(),
                  onChanged: (String? city) {
                    setState(() {
                      selectedCity = city;
                    });

                    widget.itemIndex([
                      selectedCountryIndex,
                      allCountries[selectedCountry]!.indexOf(city!)
                    ]);
                  },
                ))
          ]),
          5.verticalSpace,
          // ]
        ]));
  }
}
