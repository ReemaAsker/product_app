abstract class AppException implements Exception {
  final String message;
  final int? code;

  AppException(this.message, {this.code});

  @override
  String toString() => message;
}

class ServerException extends AppException {
  ServerException(String message, {int? code}) : super(message, code: code);
}

class AuthenticationException extends AppException {
  AuthenticationException(String message) : super(message);
}

class ValidationException extends AppException {
  ValidationException(String message) : super(message);
}

class ParsingException extends AppException {
  ParsingException() : super("Failed to parse response");
}

class InvalidDataException extends AppException {
  InvalidDataException(String message) : super(message);
}

class BadRequestException extends ServerException {
  BadRequestException() : super("Bad request", code: 400);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException() : super("Unauthorized", code: 401);
}

class ForbiddenException extends ServerException {
  ForbiddenException() : super("Forbidden", code: 403);
}

class NotFoundException extends ServerException {
  NotFoundException() : super("Resource not found", code: 404);
}

class InternalServerErrorException extends ServerException {
  InternalServerErrorException() : super("Internal server error", code: 500);
}

class NetworkException extends AppException {
  NetworkException(super.message);
}

class TimeoutException extends NetworkException {
  TimeoutException() : super("Connection timed out");
}

class NoInternetException extends NetworkException {
  NoInternetException() : super("No internet connection");
}
