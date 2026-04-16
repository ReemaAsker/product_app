import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<Product> _myProducts = [];

  CartCubit() : super(CartInitial());

  double _calculateTotal() {
    return _myProducts.fold(0.0, (sum, item) => sum + (item.price ?? 0.0));
  }

  bool isEmpty() {
    return _myProducts.isEmpty;
  }

  void addToCart(Product product) {
    if (!_myProducts.contains(product)) {
      _myProducts.add(product);
      emit(CartUpdated(List.from(_myProducts), _calculateTotal()));
    }
  }

  void removeFromCart(Product product) {
    _myProducts.remove(product);
    if (_myProducts.isEmpty) {
      emit(CartInitial());
    } else {
      emit(CartUpdated(List.from(_myProducts), _calculateTotal()));
    }
  }

  void clearCart() {
    _myProducts.clear();
    emit(CartInitial());
  }
}
