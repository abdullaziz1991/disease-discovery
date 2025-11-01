import 'package:disease_discovery_project/features/diseases_discovery/presentation/widgets/app_text_style.dart';
import 'package:flutter/material.dart';
import '../../../../core/strings/constant.dart';
import 'package:easy_localization/easy_localization.dart';

class SelectingHerbsPage extends StatefulWidget {
  const SelectingHerbsPage({super.key});

  @override
  State<SelectingHerbsPage> createState() => _SelectingHerbsPageState();
}

class _SelectingHerbsPageState extends State<SelectingHerbsPage> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
              decoration: InputDecoration(
                  labelText: "Find the herb".tr(),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search)),
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                });
              })),
      Expanded(
          child: ListView.builder(
              itemCount: herbs.length,
              itemBuilder: (context, index) {
                final herb = herbs[index];
                return ListTile(
                    leading: Icon(
                      herbIcons[herb['name']] ?? Icons.local_florist,
                      color: Colors.green,
                    ),
                    title: AppTextStyle(text: herb['name'].toString().tr()),
                    onTap: () => _showHerbDetails(context, herb));
              }))
    ]));
  }

  void _showHerbDetails(BuildContext context, Map<String, dynamic> herb) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(herb['name'].toString().tr()),
              content: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text(
                      "benefits".tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...List<Widget>.from(
                      herb['benefits']
                          .map((b) => Text("- ${b.toString().tr()}")),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "heals_diseases".tr(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    ...List<Widget>.from(herb['heals_diseases']
                        .map((d) => Text("- ${d.toString().tr()}")))
                  ])),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("exit".tr()))
              ]);
        });
  }
}
