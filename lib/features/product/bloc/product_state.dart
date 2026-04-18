import 'package:shop_app/features/product/data/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductsSuccess extends ProductState {
  final List<Product> products;
  ProductsSuccess(this.products);
}

class ProductSuccess extends ProductState {
  final Product product;
  ProductSuccess(this.product);
}

class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
