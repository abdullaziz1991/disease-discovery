import 'package:easy_localization/easy_localization.dart';
import 'failures_extends.dart';
import 'failures.dart';

String failureMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case EmptyCacheFailure:
      return EMPTY_CACHE_FAILURE_MESSAGE;
    case OfflineFailure:
      return OFFLINE_FAILURE_MESSAGE;
    case UserExistsFailure:
      return USER_EXISTS_FAILURE_MESSAGE;
    case UserNotFoundFailure:
      return USER_NOT_FOUND_FAILURE_MESSAGE;
    case IncorrectEntryFailure:
      return INCORRECT_ENTRY_FAILURE_MESSAGE;
    case WeakPasswordFailure:
      return WEAK_PASSWORD_FAILURE_MESSAGE;
    case EmailAlreadyUsedFailure:
      return EMAIL_ALREADY_USED_FAILURE_MESSAGE;
    case NotAuthorizedFailure:
      return NOT_AUTHORIZED_FAILURE_MESSAGE;
    case TimeoutFailure:
      return TIMEOUT_FAILURE_MESSAGE;
    case TooManyAttemptsFailure:
      return TOO_MANY_ATTEMPTS_FAILURE_MESSAGE;
    case ExpiredTokenFailure:
      return Expired_Token_FAILURE_MESSAGE;
    // case LoginFailedFailure:
    //   return LOGING_FAILED_FAILURE_MESSAGE;
    case RegistrationFailedFailure:
      return REGISTRATION_FAILED_FAILURE_MESSAGE;
    case InvalidRefreshTokenFailure:
      return INVALID_REFRESH_TOKEN_FAILURE_MESSAGE;
    case UpdateRequiredFailure:
      final updateFailure = failure as UpdateRequiredFailure;
      return "A new version released".tr() + "\n${updateFailure.updateUrl}";
    //  return UPDATE_REQUIRED_FAILURE_MESSAGE;
    default:
      return "There was a problem, Please try again later".tr();
  }
}
