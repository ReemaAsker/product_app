import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/errors/app_exception.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;
  List<Product> products = [];

  ProductCubit(this.repository) : super(ProductInitial());

  Future<void> fetchSingleProduct(int id) async {
    emit(ProductLoading());
    try {
      Product product = await repository.fetchSingleProduct(id);
      emit(ProductSuccess(product));
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> fetchByCategory(String slug) async {
    emit(ProductLoading());
    try {
      products = await repository.fetchProductsByCategory(slug);
      emit(ProductsSuccess(products));
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> searchOfProducts(String title) async {
    emit(ProductLoading());

    final filtered = products
        .where(
          (product) =>
              (product.title ?? '').toLowerCase().contains(title.toLowerCase()),
        )
        .toList();
    emit(ProductsSuccess(filtered));
  }

  void _handleError(dynamic e) {
    if (e is AppException) {
      emit(ProductError(e.message));
    } else {
      emit(ProductError("Unexpected error"));
    }
  }
}
