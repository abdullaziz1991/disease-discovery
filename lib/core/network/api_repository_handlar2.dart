import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import '../exceptions/exceptions.dart';
import '../failure/failures_extends.dart';
import 'network_info.dart';

// class ApiRepositoryHandler {
//   static Future<Either<Failure, T>> execute<T>(
//       {required Future<T> Function() request,
//       void Function(T)? onSuccess}) async {
//     // final networkInfo = getIt<NetworkInfo>();
//     // final dio = getIt<Dio>();
//     final NetworkInfo networkInfo = GetIt.I<NetworkInfo>();
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await request();
//         return Right(result);
//       } on UpdateRequiredException catch (e) {
//         return Left(UpdateRequiredFailure(updateUrl: e.updateUrl));
//       } on InvalidRefreshTokenException catch (e) {
//         return Left(InvalidRefreshTokenFailure());
//       } on UserNotFoundException {
//         return Left(UserNotFoundFailure());
//       } on NotAuthorizedException {
//         return Left(NotAuthorizedFailure());
//       } on UserAlreadyExistsException {
//         return Left(UserExistsFailure());
//       } on TooManyAttemptsException {
//         return Left(TooManyAttemptsFailure());
//       } on TimeoutServerDidNotRespondException {
//         return Left(TimeoutFailure());
//       } on IncorrectEntryException {
//         return Left(IncorrectEntryFailure());
//       } on RegistrationFailedException {
//         return Left(RegistrationFailedFailure());
//       }
//       // on LoginFailedException {
//       //   return Left(LoginFailedFailure());
//       // }
//       on ExpiredTokenException {
//         return Left(ExpiredTokenFailure());
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }
// }



// class ApiRepositoryHandler {
//   static Future<Either<Failure, T>> execute<T>(
//       {required Future<T> Function() request,
//       void Function(T)? onSuccess,
//       required NetworkInfo networkInfo}) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await request();
//         return Right(result);
//       } on UpdateRequiredException catch (e) {
//         return Left(UpdateRequiredFailure(updateUrl: e.updateUrl));
//       } on UserNotFoundException {
//         return Left(UserNotFoundFailure());
//       } on NotAuthorizedException {
//         return Left(NotAuthorizedFailure());
//       } on UserAlreadyExistsException {
//         return Left(UserExistsFailure());
//       } on TooManyAttemptsException {
//         return Left(TooManyAttemptsFailure());
//       } on TimeoutServerDidNotRespondException {
//         return Left(TimeoutFailure());
//       } on IncorrectEntryException {
//         return Left(IncorrectEntryFailure());
//       } on ServerException {
//         return Left(ServerFailure());
//       }
//     } else {
//       return Left(OfflineFailure());
//     }
//   }
// }
