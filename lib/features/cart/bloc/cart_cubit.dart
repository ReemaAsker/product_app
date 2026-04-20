import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/data/cartItem.dart';
import 'package:shop_app/features/product/data/product.dart';
import '../repo/cart_local_storage.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial()) {
    _loadCart();
  }

  final CartLocalStorage storage = CartLocalStorage();
  final List<CartItemModel> _items = [];

  // =========================
  // LOAD CART
  // =========================
  Future<void> _loadCart() async {
    final items = await storage.getCart();

    _items
      ..clear()
      ..addAll(items);

    _emitUpdated();
  }

  // =========================
  // CALCULATE TOTAL
  // =========================
  double _calculateTotal() {
    return _items.fold(
      0,
      (sum, item) => sum + (item.product.price ?? 0) * item.quantity,
    );
  }

  // =========================
  // EMIT + SAVE
  // =========================
  void _emitUpdated() {
    final state = CartState.updated(
      items: List.unmodifiable(_items),
      totalPrice: _calculateTotal(),
    );

    emit(state);
    _save();
  }

  Future<void> _save() async {
    await storage.saveCart(_items);
  }

  // =========================
  // ADD
  // =========================
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

  // =========================
  // REMOVE (decrease)
  // =========================
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

  // =========================
  // DELETE ITEM
  // =========================
  void deleteItem(Product product) {
    _items.removeWhere((e) => e.product.id == product.id);

    _items.isEmpty ? emit(const CartState.initial()) : _emitUpdated();
  }

  // =========================
  // CLEAR CART
  // =========================
  void clearCart() {
    _items.clear();
    emit(const CartState.initial());
    storage.clearCart(); // 🔥 important
  }

  // =========================
  // CHECKOUT
  // =========================
  Future<void> checkout() async {
    if (_items.isEmpty) return;

    try {
      emit(const CartState.loading());

      await Future.delayed(const Duration(seconds: 2));

      final total = _calculateTotal();

      emit(CartState.checkoutSuccess(total: total));

      _items.clear();
      emit(const CartState.initial());

      await storage.clearCart();
    } catch (_) {
      emit(const CartState.error(message: "Checkout failed"));
    }
  }

  // =========================
  // HELPERS
  // =========================
  int getQuantity(Product product) {
    final item = _items.where((e) => e.product.id == product.id).firstOrNull;
    return item?.quantity ?? 0;
  }

  bool isInCart(Product product) {
    return _items.any((e) => e.product.id == product.id);
  }

  bool isEmpty() => _items.isEmpty;
}
