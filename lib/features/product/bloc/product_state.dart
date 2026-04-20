import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_app/features/product/data/product.dart';

part 'product_state.freezed.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;

  const factory ProductState.loading() = ProductLoading;

  const factory ProductState.productsSuccess(List<Product> products) =
      ProductsSuccess;

  const factory ProductState.productSuccess(Product product) = ProductSuccess;

  const factory ProductState.error(String message) = ProductError;
}
