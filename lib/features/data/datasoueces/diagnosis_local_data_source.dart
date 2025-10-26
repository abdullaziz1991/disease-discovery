// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import '../../../app/database/sqfLite_patient.dart';
// import '../models/response_model.dart';

// @injectable
// class PatientLocalDataSource {
//   final SqfLitePatient sqfLite;
//   PatientLocalDataSource({required this.sqfLite});
//   String tableName = "patients";
//   // إضافة مريض
//   Future<PatientDataModel> addPatient(PatientDataModel patientData) async {
//     print(patientData.age);
//     print(patientData.doctorId);
//     print(patientData.firstDate);
//     print(patientData.fullName);
//     print(patientData.gender);
//     print(patientData.id);
//     print(patientData.note);
//     print(patientData.phone);
//     print(patientData.serverId);
//     print("+++++++----------------------------------");

//     int newId = await sqfLite.insert(tableName, patientData.toJson());
//     print("Insert Response: $newId");
//     // PatientDataModel newPatientData = patientData;
//     // newPatientData.copyWith(id: )
//     patientData.id = newId;
//     return patientData;
//   }

//   // جلب كل المرضى
//   Future<List<PatientDataModel>> getAllPatients() async {
//     List<Map> response = await sqfLite.read(tableName);
//     return response
//         .map((row) => PatientDataModel.fromJson(Map<String, dynamic>.from(row)))
//         .toList();
//   }

//   // حذف مريض
//   Future<Unit> deletePatient(int id) async {
//     int response =
//         await sqfLite.delete(tableName, where: "id = ?", whereArgs: [id]);
//     print("Delete Response: $response");
//     return Future.value(unit);
//   }

//   // تعديل بيانات مريض
//   Future<Unit> updatePatient(PatientDataModel patientData) async {
//     int response = await sqfLite.update(tableName, patientData.toJson(),
//         where: "id = ?", whereArgs: [patientData.id]);

//     print("Update Response: $response");
//     return Future.value(unit);
//   }
// }

