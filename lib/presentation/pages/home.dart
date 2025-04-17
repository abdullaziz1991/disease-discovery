import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../app/app_appBar.dart';
import 'detecting_diseases_microphone.dart';
import 'detecting_diseases_select.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedScreenIndex = 0;
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> screens = [
      {
        'Screen': const DetectingDiseasesMicrophone(),
        'Title': "Symptom Input".tr(),
      },
      {
        'Screen': DetectingDiseasesSelect(),
        'Title': "Select Symptoms".tr(),
      },
    ];
   
    return Scaffold(
        appBar:
            AppAppBar(title: screens[_selectedScreenIndex]['Title'].toString()),
        body: screens[_selectedScreenIndex]['Screen'] as Widget,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.dashboard), label: "Symptom Input".tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.cabin), label: "Select Symptoms".tr()),
          ],
        ));
  }
}
