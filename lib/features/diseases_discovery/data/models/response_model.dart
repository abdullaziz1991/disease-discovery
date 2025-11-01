class ResponseModel {
  String diagnosis;
  List<String> advices;
  double confidence;

  ResponseModel({
    required this.diagnosis,
    required this.advices,
    required this.confidence,
  });

}
