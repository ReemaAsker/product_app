abstract class AppException implements Exception {
  final String message;
  final String userMessage;
  final int? code;

  const AppException({
    required this.message,
    required this.userMessage,
    this.code,
  });

  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException({
    required super.message,
    required super.userMessage,
    super.code,
  });
}

class BadRequestException extends ServerException {
  const BadRequestException()
    : super(
        message: "Bad request",
        userMessage: "Something went wrong. Please try again.",
        code: 400,
      );
}

class UnauthorizedException extends ServerException {
  const UnauthorizedException()
    : super(
        message: "Unauthorized",
        userMessage: "Please login again.",
        code: 401,
      );
}

class ForbiddenException extends ServerException {
  const ForbiddenException()
    : super(
        message: "Forbidden",
        userMessage: "You don't have permission to perform this action.",
        code: 403,
      );
}

class NotFoundException extends ServerException {
  const NotFoundException()
    : super(
        message: "Resource not found",
        userMessage: "The requested item was not found.",
        code: 404,
      );
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException()
    : super(
        message: "Internal server error",
        userMessage: "Server error. Please try again later.",
        code: 500,
      );
}

class AuthenticationException extends AppException {
  const AuthenticationException()
    : super(
        message: "Authentication failed",
        userMessage: "Invalid email or password.",
      );
}

class ValidationException extends AppException {
  const ValidationException(String field)
    : super(
        message: "Invalid input: $field",
        userMessage: "Please check your input and try again.",
      );
}

class ParsingException extends AppException {
  const ParsingException()
    : super(
        message: "Parsing error",
        userMessage: "Unexpected data format. Please try again.",
      );
}

class NetworkException extends AppException {
  const NetworkException({required super.message, required super.userMessage});
}

class TimeoutException extends NetworkException {
  const TimeoutException()
    : super(
        message: "Request timeout",
        userMessage: "Connection timed out. Please try again.",
      );
}

class NoInternetException extends NetworkException {
  const NoInternetException()
    : super(
        message: "No internet",
        userMessage: "No internet connection. Check your network.",
      );
}
