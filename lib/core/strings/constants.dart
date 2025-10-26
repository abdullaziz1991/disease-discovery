import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

final doctorList = ["Mohammad", "Nour"];
List<String> genderList = ["male", "female"];
List<String> productStatusList = ["New", "Used"];
List<String> categoriesList = [
  "All",
  "Cars",
  "Real Estate",
  "Restaurant",
  "Clothes",
  "Taxi",
  "Mobiles",
  "Computers",
  "Electronics",
  "Others"
];

List<String> productCategoryList = categoriesList.sublist(1);

List<IconData> categoriesListIcon = [
  Icons.article,
  Icons.directions_car,
  Icons.domain,
  Icons.restaurant,
  Icons.checkroom,
  Icons.local_taxi,
  Icons.style,
  Icons.motorcycle,
  Icons.electric_bolt,
  Icons.group_work
];

List<String> productPlaceList = [
  "Aleppo",
  "Damascus",
  "Homs",
  "Hama",
  "Daraa",
  "Latakia",
  "Deir Ezzor",
  "Tartous"
];
List<String> daysList = [
  "One day",
  "Two days",
  "Three days",
  "Four days",
  "Five days",
  "Six days",
  "Seven days",
  "Eight days",
  "Nine days",
  "Ten days"
];

List<String> sortByList = [
  "recently added",
  "time remaining",
  "importance: high to low",
  "importance: low to high",
];

List<String> currencyList = [
  "Sp",
  "\$",
  "€",
];

// List<String> genderList = ["Male", "Female"];

List<String> popupMenuList = [
  "recently added".tr(),
  "time remaining".tr(),
  "importance: high to low".tr()
];

List<String> arabicCountryCodes = [
  "SY", // سوريا
  "LB", // لبنان
  "TR", // تركيا
  "IQ", // العراق
  "JO", // الأردن
  "DZ", // الجزائر
  "BH", // البحرين
  "EG", // مصر
  "KW", // الكويت
  "OM", // عمان
  "QA", // قطر
  "SA", // السعودية
  "AE", // الإمارات العربية المتحدة
];
