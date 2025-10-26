class ResponseModel {
  String diagnosis;
  List<String> advices;
  double confidence;

  ResponseModel({
    required this.diagnosis,
    required this.advices,
    required this.confidence,
  });

  // /// لتحويل JSON (من API أو ملفات) إلى كائن
  // factory PatientDataModel.fromJson(Map<String, dynamic> json) {
  //   return PatientDataModel(
  //     id: json['id'],
  //     fullName: json['fullName'],
  //     age: json['age'],
  //     firstDate: DateTime.tryParse(json['firstDate'] ?? '') ?? DateTime.now(),
  //     phone: json['phone'],
  //     note: json['note'] ?? '',
  //     gender: json['gender'],
  //     doctorId: json['doctorId'],
  //     serverId: json['serverId'],
  //   );
  // }

  // /// لتحويل الكائن إلى JSON (عند الإرسال إلى API)
  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'fullName': fullName,
  //     'age': age,
  //     'firstDate': firstDate.toIso8601String(),
  //     'phone': phone,
  //     'note': note,
  //     'gender': gender,
  //     'doctorId': doctorId,
  //     'serverId': serverId,
  //   };
  // }

  // PatientDataModel copyWith({
  //   int? id,
  //   String? fullName,
  //   int? age,
  //   DateTime? firstDate,
  //   String? phone,
  //   String? note,
  //   String? gender,
  //   int? doctorId,
  //   int? serverId,
  // }) {
  //   return PatientDataModel(
  //     id: id ?? this.id,
  //     fullName: fullName ?? this.fullName,
  //     age: age ?? this.age,
  //     firstDate: firstDate ?? this.firstDate,
  //     phone: phone ?? this.phone,
  //     note: note ?? this.note,
  //     gender: gender ?? this.gender,
  //     doctorId: doctorId ?? this.doctorId,
  //     serverId: serverId ?? this.serverId,
  //   );
  // }
}
