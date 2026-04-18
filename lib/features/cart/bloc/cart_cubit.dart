import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Product> _myProducts = [];

  CartCubit() : super(const CartState.initial());

  double _calculateTotal() {
    return _myProducts.fold(0.0, (sum, item) => sum + (item.price ?? 0.0));
  }

  void addToCart(Product product) {
    if (!_myProducts.contains(product)) {
      _myProducts.add(product);

      emit(
        CartState.updated(
          products: List.from(_myProducts),
          totalPrice: _calculateTotal(),
        ),
      );
    }
  }

  void removeFromCart(Product product) {
    _myProducts.remove(product);

    if (_myProducts.isEmpty) {
      emit(const CartState.initial());
    } else {
      emit(
        CartState.updated(
          products: List.from(_myProducts),
          totalPrice: _calculateTotal(),
        ),
      );
    }
  }

  Future<void> checkout() async {
    try {
      emit(const CartState.loading());

      await Future.delayed(const Duration(seconds: 2));

      final total = _calculateTotal();

      emit(CartState.checkoutSuccess(total: total));

      _myProducts.clear();
      emit(const CartState.initial());
    } catch (e) {
      emit(const CartState.error(message: "Checkout failed"));
    }
  }

  void clearCart() {
    _myProducts.clear();
    emit(const CartState.initial());
  }

  bool isEmpty() => _myProducts.isEmpty;
}
