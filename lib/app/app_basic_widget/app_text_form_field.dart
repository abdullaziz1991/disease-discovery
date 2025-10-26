// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';

import '/app/app_theme/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class AppTextFormField extends StatefulWidget {
  String? validator1;
  String? validator2;
  IconData? icon;
  Color? iconColor;
  String hintText;
  TextInputType textInputType;
  int maxLenght;
  int minLenght;
  TextEditingController controllers;
  FocusNode? focusNode; // ⬅️ أضفنا خاصية focusNode هنا
  String? value;
  bool? isDark;
  int? maxLine;
  int? minLine;
  double? padding;
  double? contentPadding;
  void Function(String)? onChanged;
  void Function(String)? onFieldSubmitted;
  Function()? onSuffixPressed;
  final VoidCallback? onTap;
  bool? isBorderRemoved;
  bool isDateField;

  AppTextFormField({
    super.key,
    this.validator1,
    this.validator2,
    this.icon,
    this.iconColor,
    required this.hintText,
    required this.textInputType,
    required this.maxLenght,
    required this.minLenght,
    required this.controllers,
    this.focusNode, // ⬅️ أضفنا focusNode هنا في constructor
    this.value,
    this.isDark,
    this.maxLine,
    this.minLine,
    this.padding,
    this.contentPadding,
    this.onChanged,
    this.onFieldSubmitted,
    this.onSuffixPressed,
    this.onTap,
    this.isBorderRemoved = false,
    this.isDateField = false,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool suffixIconVisibility = false;
  late FocusNode _internalFocusNode; // ⬅️ focusNode داخلي إذا لم يتم توفيره

  @override
  void initState() {
    super.initState();

    // ⬅️ تهيئة focusNode: استخدام المزود أو إنشاء واحد داخلي
    _internalFocusNode = widget.focusNode ?? FocusNode();

    widget.controllers.addListener(() {
      if (mounted) {
        setState(() {
          suffixIconVisibility = widget.controllers.text.isNotEmpty;
        });
      }
    });
  }

  @override
  void dispose() {
    widget.controllers.removeListener(() {});
    // ⬅️ التخلص من focusNode الداخلي فقط إذا لم يكن مزوداً من الخارج
    if (widget.focusNode == null) {
      _internalFocusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.padding ?? 0),
      child: TextFormField(
        controller: widget.controllers,
        focusNode: _internalFocusNode, // ⬅️ استخدام focusNode هنا
        validator: (val) {
          if (val == null || val.isEmpty) {
            return widget.validator1;
          }
          if (val.length > widget.maxLenght) {
            return widget.validator1;
          }
          if (val.length < widget.minLenght) {
            return widget.validator2;
          }
          if ((widget.hintText == "Email" || widget.hintText == "الإميل")) {
            final RegExp emailRegex = RegExp(
              r'^[^@]+@[^@]+\.[^@]+',
            );
            if (!emailRegex.hasMatch(val)) {
              return 'Please enter a valid email address';
            }
          }
          return null;
        },
        keyboardType: widget.textInputType,
        style: TextStyle(color: context.colorScheme.onSurface,fontSize: 14),
        maxLines: widget.maxLine,
        minLines: widget.minLine,
        inputFormatters: [
          LengthLimitingTextInputFormatter(widget.maxLenght)
        ],
        onFieldSubmitted: widget.onFieldSubmitted,
        onChanged: widget.onChanged,
        onTap: widget.onTap ?? // إضافة onTap المخصص
            (widget.isDateField
                ? () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );
              if (pickedDate != null) {
                widget.controllers.text =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
              }
            }
                : null),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.symmetric(
              vertical: widget.contentPadding ?? 15.h, horizontal: 20.w),
          prefixIcon: widget.icon != null
              ? Icon(
            widget.icon,
            color: widget.iconColor ?? context.colorScheme.onSurfaceVariant,
            size: 17.r,
          )
              : null,
          suffixIcon: suffixIconVisibility
              ? IconButton(
            icon: Icon(Icons.clear, size: 20.r,color: Colors.grey,),
            onPressed: () {
              widget.controllers.clear();
              widget.onSuffixPressed?.call();
              if (mounted) {
                setState(() {
                  suffixIconVisibility = false;
                });
              }
            },
          )
              : null,
          enabledBorder: widget.isBorderRemoved == false
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 1, color: context.colorScheme.primary),
          )
              : InputBorder.none,
          focusedBorder: widget.isBorderRemoved == false
              ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                width: 1, color: context.colorScheme.primary),
          )
              : InputBorder.none,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color:context.colorScheme.onSurface,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: "Figtree-Regular",
          ),
        ),
      ),
    );
  }
}