// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppDropdownButtonForm extends StatefulWidget {
  final String selectedItem;
  final String labelText;
  final IconData icon;
  final List<String> list;
  final ValueChanged<int> itemIndex;

  const AppDropdownButtonForm({
    Key? key,
    required this.selectedItem,
    required this.labelText,
    required this.icon,
    required this.list,
    required this.itemIndex,
  }) : super(key: key);

  @override
  State<AppDropdownButtonForm> createState() => _AppDropdownButtonFormState();
}

class _AppDropdownButtonFormState extends State<AppDropdownButtonForm> {
  List<String> list2 = [];
  @override
  void didChangeDependencies() {
    for (int i = 0; i < widget.list.length; i++) {
      list2.add(widget.list[i].tr());
    }
    // list2 = widget.list;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        value: widget.selectedItem.tr(),
        decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: const TextStyle(color: Color(0xFF607D8B)),
            prefixIcon: Icon(widget.icon, color: Color(0xFF455A64)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
        items: list2
            .map((value) => DropdownMenuItem(
                value: value.tr(),
                child: Text(value, style: TextStyle(color: Color(0xFF607D8B)))))
            .toList(),
        onChanged: (val) =>
            setState(() => widget.itemIndex(list2.indexOf(val!) + 1))

        // widget.selectedItem = val?.tr()),
        );
  }
}
