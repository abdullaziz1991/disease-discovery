import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UserExistsFailure extends Failure {
  @override
  List<Object> get props => [];
}

class IncorrectEntryFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UserNotFoundFailure extends Failure {
  @override
  List<Object> get props => [];
}

class EmailAlreadyUsedFailure extends Failure {
  @override
  List<Object> get props => [];
}

class WeakPasswordFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NotAuthorizedFailure extends Failure {
  @override
  List<Object> get props => [];
}

class TimeoutFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UpdateRequiredFailure extends Failure {
  final String updateUrl;
  UpdateRequiredFailure({required this.updateUrl});

  @override
  List<Object?> get props => [updateUrl];
}

class TooManyAttemptsFailure extends Failure {
  @override
  List<Object> get props => [];
}

// class LoginFailedFailure extends Failure {
//   @override
//   List<Object> get props => [];
// }
class ExpiredTokenFailure extends Failure {
  @override
  List<Object> get props => [];
}

class RegistrationFailedFailure extends Failure {
  @override
  List<Object> get props => [];
}

class InvalidRefreshTokenFailure extends Failure {
  @override
  List<Object> get props => [];
}
