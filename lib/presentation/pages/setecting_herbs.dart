import 'package:flutter/material.dart';
import '../../app/constant.dart';

class SeletectingHerbs extends StatefulWidget {
  @override
  _SeletectingHerbsState createState() => _SeletectingHerbsState();
}

class _SeletectingHerbsState extends State<SeletectingHerbs> {
  String query = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
              decoration: const InputDecoration(
                  labelText: 'ابحث عن العشبة',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search)),
              onChanged: (value) {
                setState(() {
                  query = value.toLowerCase();
                  // "Abdulaziz"  "abdulaziz"
                });
              })),
      Expanded(
          child: ListView(
              children: herbs
                  .where((herb) => herb['name'].toLowerCase().contains(query))
                  .map((herb) => ListTile(
                        leading: Icon(
                            herbIcons[herb['name']] ?? Icons.local_florist,
                            color: Colors.green),
                        title: Text(herb['name']),
                        onTap: () => showHerbDetails(context, herb),
                      ))
                  .toList()))
// .where((herb) => herb['name'].toLowerCase().contains(query))
// قوم هذه الدالة بتصفية الأعشاب بناءً على نص البحث المدخل من المستخدم (query)،
//
// .map((herb) => ListTile(...))
// بعد تصفية الأعشاب، يتم تحويل كل عنصر عشبة إلى عنصر واجهة مستخدم (ListTile) يُعرض في القائمة.
//
// .toList()
// تُحوِّل النتيجة النهائية من Iterable إلى List<Widget>، لتتمكن من عرضها ضمن ListView.
    ]));
  }

  void showHerbDetails(BuildContext context, Map<String, dynamic> herb) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(herb['name']),
              content: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    const Text("فوائد:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...herb['benefits']
                        // .map<Widget>((b) => Text("- $b"))
                        .map((b) => Text("- $b"))
                        .toList(),
                    // تقوم بتحويل كل عنصر في هذه القائمة إلى عنصر واجهة (Widget) من نوع Text يحتوي على الفائدة مع شرطة (-) في البداية
                    const SizedBox(height: 10),
                    const Text("الأمراض التي تعالجها:",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    ...herb['heals_diseases']
                        .map<Widget>((d) => Text("- $d"))
                        .toList()
                  ])),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('إغلاق'))
              ]);
        });
  }
}
