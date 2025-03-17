class ChangeList {
  Map<String, String> symptomsMap = {};

  ChangeList(List<String> slectedSymptoms) {
    symptomsMap = {for (var symptom in slectedSymptoms) symptom: "1"};
  }

  // دالة تُعيد القائمة الجديدة
  Map<String, String> getUpdatedList() {
    return symptomsMap;
  }
}
