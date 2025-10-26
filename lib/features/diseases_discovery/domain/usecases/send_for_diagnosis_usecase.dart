
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/failure/failures_extends.dart';
import '../../data/models/response_model.dart';
import '../repositories/diagnosis_repository.dart';

@injectable
class SendForDiagnosisUsecase {
  final DiagnosisRepository repository;
  SendForDiagnosisUsecase(this.repository);
  Future<Either<Failure, ResponseModel>> call(Map<String, dynamic> data) async {
    return await repository.sendForDiagnosis(data);
  }
}

// call = callable class => we can do -- AddPostUsecase(post)
// the class become function 