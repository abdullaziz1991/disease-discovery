// // ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/app/app_theme/extension.dart';
import '/app/methods/app_text_style.dart';

// ignore: must_be_immutable
class AppDropdownButton extends StatefulWidget {
  String initialValue;
  List<String> list;
  IconData icon;
  final ValueChanged<int> itemIndex;
  String title;
  double paddingHorizontal;
  double marginorizontal;
  double borderWidth;
  AppDropdownButton({
    Key? key,
    required this.initialValue,
    required this.list,
    required this.icon,
    required this.itemIndex,
    required this.title,
    this.paddingHorizontal = 2,
    this.marginorizontal = 2,
    this.borderWidth = 1,
  }) : super(key: key);

  @override
  State<AppDropdownButton> createState() => _AppDropdownButtonState();
}

class _AppDropdownButtonState extends State<AppDropdownButton> {
  List<String> list2 = [];

  @override
  void didChangeDependencies() {
    for (int i = 0; i < widget.list.length; i++) {
      list2.add(widget.list[i].tr());
    }
    print(widget.initialValue);
    print(widget.list);
    print(widget.title);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: widget.paddingHorizontal),
      margin: EdgeInsets.symmetric(horizontal: widget.marginorizontal),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            width: widget.borderWidth ?? 1, color: context.colorScheme.primary),
      ),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Icon(
            widget.icon,
            color: Colors.black,
          ),
        ), //size: 27.r
        SizedBox(width: 10),
        Expanded(
            flex: 2,
            child: AppTextStyle(
                text: widget.title,
                fontSize: 12,
                color: context.colorScheme.onSurface)),
        SizedBox(width: 10),
        Expanded(
            flex: 3,
            child: DropdownButton<String>(
              value: widget.initialValue.tr(),
              isExpanded: true, // لاخذ كل المسافة المتاحة
              //  underline: SizedBox(), // لالغاء الخط السفلي
              //onChanged: (Object? value) {
              onChanged: (String? value) {
                // widget.itemIndex(list2.indexOf(value.toString()) + 1);
                widget.itemIndex(list2.indexOf(value!) + 1);
              },
              selectedItemBuilder: (BuildContext context) {
                return widget.list.map<Widget>((String item) {
                  return Container(
                      alignment: AlignmentDirectional.center,
                      child: AppTextStyle(
                          text: item.tr(),
                          fontSize: 12,
                          color: context.colorScheme.onSurface));
                }).toList();
              },
              items: widget.list.map((String item) {
                return DropdownMenuItem<String>(
                    alignment: AlignmentDirectional.center,
                    value: item.tr(),
                    child: AppTextStyle(
                        text: item.tr(),
                        fontSize: 12,
                        color: context.colorScheme.onSurface));
              }).toList(),
              icon: const Icon(
                Icons.arrow_drop_down,
              ), // تعيين الأيقونة الافتراضية
              iconEnabledColor: Color(0xFF607D8B), // لون السهم عند تفعيل
              //  iconDisabledColor: Colors.grey, // لون السهم عند تعطيل
            ))
      ]),
    );
  }
}
