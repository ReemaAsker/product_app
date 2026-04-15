import 'package:dio/dio.dart';
import 'package:shop_app/core/errors/app_exception.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://dummyjson.com/products/",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}

AppException handleDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.receiveTimeout:
      return TimeoutException();

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          return BadRequestException();
        case 401:
          return UnauthorizedException();
        case 403:
          return ForbiddenException();
        case 404:
          return NotFoundException();
        case 500:
          return InternalServerErrorException();
        default:
          return ServerException("Server error", code: e.response?.statusCode);
      }

    case DioExceptionType.unknown:
      return NoInternetException();

    default:
      return NetworkException("Unexpected network error");
  }
}
