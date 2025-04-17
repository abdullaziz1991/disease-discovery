class ChangeList {
  Map<String, String> symptomsMap = {};

  ChangeList(List<String> selectedSymptoms) {
    symptomsMap = {for (var symptom in selectedSymptoms) symptom: "1"};
  }

      // symptomsData={
      //   'skin_rash':"1",
      //   'chills': "1"
      // }

  // دالة تُعيد القائمة الجديدة
  Map<String, String> getUpdatedList() {
    return symptomsMap;
  }
}
