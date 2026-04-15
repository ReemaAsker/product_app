import 'package:dio/dio.dart';

import 'package:shop_app/core/errors/app_exception.dart';
import 'package:shop_app/core/network/dio_setup.dart';
import 'package:shop_app/features/category/data/category.dart';
import 'package:shop_app/features/product/data/product.dart';

class ProductRepository {
  final Dio dio = DioClient.dio;

  Future<List<Product>> fetchProductsByCategory(String slug) async {
    try {
      final response = await dio.get('category/$slug');
      final data = response.data['products'];

      return (data as List).map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? "Network error");
    } catch (e) {
      throw ServerException("Unexpected error");
    }
  }

  Future<List<Product>> searchProducts(String query) async {
    try {
      final response = await dio.get('/products/search?q=$query');

      return (response.data as List).map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? "Search failed");
    } catch (e) {
      throw ServerException("Unexpected error");
    }
  }

  Future<List<Category>> fetchCategories() async {
    try {
      final response = await dio.get('categories');
      return (response.data as List).map((e) => Category.fromJson(e)).toList();
    } on DioException catch (e) {
      throw NetworkException(e.message ?? "Failed to load categories");
    } catch (e) {
      throw ServerException("Unexpected error");
    }
  }
}
