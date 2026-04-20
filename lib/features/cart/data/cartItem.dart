import '../../product/data/product.dart';

class CartItemModel {
  final Product product;
  final int quantity;

  CartItemModel({required this.product, required this.quantity});

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(product: product, quantity: quantity ?? this.quantity);
  }

  Map<String, dynamic> toJson() => {
    "product": product.toJson(),
    "quantity": quantity,
  };

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      product: Product.fromJson(json["product"]),
      quantity: json["quantity"],
    );
  }
}
