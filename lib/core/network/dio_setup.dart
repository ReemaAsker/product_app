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

AppException mapDioError(DioException e) {
  switch (e.response?.statusCode) {
    case 400:
      return const BadRequestException();
    case 401:
      return const UnauthorizedException();
    case 403:
      return const ForbiddenException();
    case 404:
      return const NotFoundException();
    case 500:
      return const InternalServerErrorException();
    default:
      return const ServerException(
        message: "Unknown error",
        userMessage: "Something went wrong",
      );
  }
}
