import 'dart:async';
import 'package:dio/dio.dart';
import '../exceptions/exceptions.dart';

class ApiResponseHandler {
  static Future<dynamic> handleRequest<T>(
    Future<Response> request,
    Future<T> Function(dynamic) fromJson, {
    int timeoutSeconds = 20, // هنا القيمة الافتراضية
  }) async {
    final response =
        await request.timeout(Duration(seconds: timeoutSeconds), onTimeout: () {
      throw TimeoutServerDidNotRespondException();
    });

    // باقي الكود كما هو
    int? statusCode = response.statusCode;
    String message = (response.data is Map && response.data["message"] != null)
        ? response.data["message"].toString()
        : "";

    if (statusCode == 200 || statusCode == 201) {
      return await fromJson(response.data);
    }
    else if (statusCode == 426) {
      throw UpdateRequiredException(response.data["update_url"]);
    } else if (statusCode == 401 && message == "Invalid credentials.") {
      throw IncorrectEntryException();
    } else if (statusCode == 401 && message == "Invalid or expired token") {
      throw ExpiredTokenException();
    } else if (statusCode == 403) {
      throw NotAuthorizedException();
    } else if (statusCode == 422 && message == "EMAIL_EXISTS") {
      throw UserAlreadyExistsException();
    } else if (statusCode == 422 && message == "TOO_MANY_ATTEMPTS_TRY_LATER") {
      throw TooManyAttemptsException();
    } else if (statusCode == 422 && message == "Registration failed") {
      throw RegistrationFailedException();
    } else {
      throw ServerException();
    }
  }
}
