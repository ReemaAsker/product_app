import '../../product/data/product.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<Product> products;
  final double totalPrice;

  CartUpdated(this.products, this.totalPrice);
}
