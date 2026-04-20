import 'package:shop_app/features/product/data/product.dart';

class CartItemModel {
  final Product product;
  final int quantity;

  CartItemModel({required this.product, required this.quantity});

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(product: product, quantity: quantity ?? this.quantity);
  }
}
