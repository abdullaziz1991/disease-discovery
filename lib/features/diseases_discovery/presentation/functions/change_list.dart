class ChangeList {
  Map<String, String> symptomsMap = {};
  ChangeList(List<String> selectedSymptoms) {
    symptomsMap = {for (var symptom in selectedSymptoms) symptom: "1"};
  }
  Map<String, String> getUpdatedList() {
    return symptomsMap;
  }
}
