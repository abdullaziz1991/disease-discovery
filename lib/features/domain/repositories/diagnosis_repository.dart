
import 'package:dartz/dartz.dart';
import '../../../core/failure/failures_extends.dart';
import '../../data/models/response_model.dart';


abstract class DiagnosisRepository {
 Future<Either<Failure, ResponseModel>> sendForDiagnosis(Map<String, dynamic> data);

}

