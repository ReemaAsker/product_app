import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/features/cart/data/cartItem.dart';

class CartLocalStorage {
  static const String _key = "cart_items";

  // =========================
  // SAVE CART
  // =========================
  Future<void> saveCart(List<CartItemModel> items) async {
    final prefs = await SharedPreferences.getInstance();

    final jsonList = items.map((e) => e.toJson()).toList();

    await prefs.setString(_key, jsonEncode(jsonList));
  }

  // =========================
  // GET CART
  // =========================
  Future<List<CartItemModel>> getCart() async {
    final prefs = await SharedPreferences.getInstance();

    final data = prefs.getString(_key);

    if (data == null || data.isEmpty) return [];

    try {
      final decoded = jsonDecode(data);

      if (decoded is! List) return [];

      return decoded
          .whereType<Map<String, dynamic>>()
          .map((e) => CartItemModel.fromJson(e))
          .toList();
    } catch (_) {
      // إذا البيانات خربانة
      await clearCart();
      return [];
    }
  }

  // =========================
  // CLEAR CART
  // =========================
  Future<void> clearCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
