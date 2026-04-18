import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shop_app/features/product/data/product.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;

  const factory CartState.updated({
    required List<Product> products,
    required double totalPrice,
  }) = _Updated;

  const factory CartState.loading() = _Loading;

  const factory CartState.checkoutSuccess({required double total}) =
      _CheckoutSuccess;

  const factory CartState.error({required String message}) = _Error;
}
