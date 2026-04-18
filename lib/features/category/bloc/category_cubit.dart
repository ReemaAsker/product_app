import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/errors/app_exception.dart';
import 'package:shop_app/features/category/bloc/category_state.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final ProductRepository repository;

  CategoryCubit(this.repository) : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    try {
      final categories = await repository.fetchCategories();
      emit(CategorySuccess(categories));
    } catch (e) {
      if (e is AppException) {
        emit(CategoryError(e.message));
      } else {
        emit(CategoryError("Unexpected error"));
      }
    }
  }
}
