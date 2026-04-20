import 'package:dio/dio.dart';
import 'package:shop_app/core/errors/app_exception.dart';
import 'package:shop_app/core/network/dio_setup.dart';
import 'package:shop_app/features/category/data/category.dart';
import 'package:shop_app/features/product/data/product.dart';

class ProductRepository {
  final Dio dio = DioClient.dio;

  Future<Product> fetchSingleProduct(int id) async {
    try {
      final response = await dio.get('$id');
      return Product.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print(e.toString());
      throw const ParsingException();
    }
  }

  Future<List<Product>> fetchProductsByCategory(String slug) async {
    try {
      final response = await dio.get('category/$slug');

      final data = response.data['products'];
      print(response.data['products']);
      if (data is! List) {
        throw const ParsingException();
      }

      return data.map<Product>((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print(e.toString());
      throw const ParsingException();
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await dio.get('search', queryParameters: {'q': query});

      final data = response.data['products'];

      if (data is! List) {
        throw const ParsingException();
      }

      return data.map<Product>((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print(e.toString());
      throw const ParsingException();
    }
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await dio.get('categories');

      if (response.data is! List) {
        throw const ParsingException();
      }

      return (response.data as List).map((e) => Category.fromJson(e)).toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    } catch (e) {
      print(e.toString());
      throw const ParsingException();
    }
  }

  AppException _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return const TimeoutException();
    }

    if (e.type == DioExceptionType.unknown) {
      return const NoInternetException();
    }

    final statusCode = e.response?.statusCode;

    switch (statusCode) {
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
          message: "Unknown server error",
          userMessage: "Something went wrong. Please try again.",
        );
    }
  }
}
