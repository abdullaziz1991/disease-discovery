import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:disease_discovery_project/features/diseases_discovery/data/models/response_model.dart';
import '../../../../app/api/api_repository_handlar.dart';
import '../../../../core/failure/failures_extends.dart';
import '../../domain/repositories/diagnosis_repository.dart';
import '../datasoueces/diagnosis_remote_data_source.dart';

@Injectable(as: DiagnosisRepository)
class DiagnosisRepositoryImpl implements DiagnosisRepository {
  final DiagnosisRemoteDataSource remoteDataSource;
  DiagnosisRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ResponseModel>> sendForDiagnosis(
      Map<String, dynamic> data) async {
    return await ApiRepositoryHandler.execute(request: () async {
      return await remoteDataSource.sendForDiagnosis(data);
    });
  }
}
