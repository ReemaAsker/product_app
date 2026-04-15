import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/errors/app_exception.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository repository;

  ProductCubit(this.repository) : super(ProductInitial());

  Future<void> fetchByCategory(String slug) async {
    emit(ProductLoading());
    try {
      final products = await repository.fetchProductsByCategory(slug);
      emit(ProductSuccess(products));
    } catch (e) {
      _handleError(e);
    }
  }

  void _handleError(dynamic e) {
    if (e is AppException) {
      emit(ProductError(e.message));
    } else {
      emit(ProductError("Unexpected error"));
    }
  }
}
