import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/data/cartItem.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());

  final List<CartItemModel> _items = [];

  CartState _emitUpdated() {
    final total = _items.fold<double>(
      0,
      (sum, item) => sum + (item.product.price ?? 0) * item.quantity,
    );

    final newState = CartState.updated(
      items: List.unmodifiable(_items),
      totalPrice: total,
    );

    emit(newState);
    return newState;
  }

  void addToCart(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      _items[index] = _items[index].copyWith(
        quantity: _items[index].quantity + 1,
      );
    } else {
      _items.add(CartItemModel(product: product, quantity: 1));
    }

    _emitUpdated();
  }

  void removeFromCart(Product product) {
    final index = _items.indexWhere((e) => e.product.id == product.id);

    if (index == -1) return;

    final item = _items[index];

    if (item.quantity > 1) {
      _items[index] = item.copyWith(quantity: item.quantity - 1);
    } else {
      _items.removeAt(index);
    }

    _items.isEmpty ? emit(const CartState.initial()) : _emitUpdated();
  }

  void deleteItem(Product product) {
    _items.removeWhere((e) => e.product.id == product.id);

    _items.isEmpty ? emit(const CartState.initial()) : _emitUpdated();
  }

  void clearCart() {
    _items.clear();
    emit(const CartState.initial());
  }

  Future<void> checkout() async {
    if (_items.isEmpty) return;

    try {
      emit(const CartState.loading());

      await Future.delayed(const Duration(seconds: 2));

      final total = _items.fold<double>(
        0,
        (sum, item) => sum + (item.product.price ?? 0) * item.quantity,
      );

      emit(CartState.checkoutSuccess(total: total));

      _items.clear();
      emit(const CartState.initial());
    } catch (_) {
      emit(const CartState.error(message: "Checkout failed"));
    }
  }

  int getQuantity(Product product) {
    final item = _items.firstWhere(
      (e) => e.product.id == product.id,
      orElse: () => CartItemModel(product: product, quantity: 0),
    );
    return item.quantity;
  }

  bool isInCart(Product product) {
    return _items.any((e) => e.product.id == product.id);
  }

  bool isEmpty() => _items.isEmpty;
}
