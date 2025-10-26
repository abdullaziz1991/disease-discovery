class ServerException implements Exception {}

class EmptyCacheException implements Exception {}

class OfflineException implements Exception {}

class UserAlreadyExistsException implements Exception {}

class UserNotFoundException implements Exception {}

class IncorrectEntryException implements Exception {}

class EmailAlreadyUsedException implements Exception {}

class WeakPasswordException implements Exception {}

class NotAuthorizedException implements Exception {}

class ExpiredTokenException implements Exception {}

class TimeoutServerDidNotRespondException implements Exception {}

//class UpdateRequiredException implements Exception {}
class UpdateRequiredException implements Exception {
  final String updateUrl;
  UpdateRequiredException(this.updateUrl);
}

class TooManyAttemptsException implements Exception {}

// class LoginFailedException implements Exception {}

class RegistrationFailedException implements Exception {}

class InvalidRefreshTokenException implements Exception {}
