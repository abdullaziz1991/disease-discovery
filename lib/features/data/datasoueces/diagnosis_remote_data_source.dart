import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import '../../../../app/api/api_response_handler.dart';
import '../../../../app/api/api_routes.dart';
import '../models/response_model.dart';

@injectable
class DiagnosisRemoteDataSource {
  final Dio dio;

  DiagnosisRemoteDataSource({required this.dio});

  Future<ResponseModel> sendForDiagnosis(Map<String, dynamic> data) async {
    return await ApiResponseHandler.handleRequest<ResponseModel>(
        dio.post(ApiRoutes.services.predict, data: jsonEncode(data)),
        (json) async {
      String diseases;
      List<String> advices;
      double confidence = double.tryParse(json["confidence"].toString()) ?? 0.0;
      if (confidence > 59) {
        diseases = json["disease"];
        advices = List<String>.from(data["advice"]);
      } else {
        diseases = "No diagnosis".tr();
        advices = ["Please consult a doctor".tr()];
      }
      ResponseModel responseModel = ResponseModel(
          diagnosis: diseases, advices: advices, confidence: confidence);
      return responseModel;
    });
  }
}
