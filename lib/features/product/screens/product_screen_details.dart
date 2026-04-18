import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';
import 'package:shop_app/features/cart/screens/cart_screen.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'package:shop_app/features/product/screens/widgets/custom_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchSingleProduct(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),

      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return DefaultWidget(text: state.message);
          }
          if (state is ProductSuccess) {
            Product product = state.product;
            return Column(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  color: Colors.grey[100],
                  child: Image.network(
                    product.thumbnail ?? product.images?.first ?? '',
                    fit: BoxFit.contain,
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ListView(
                      children: [
                        /// Title
                        Text(
                          product.title ?? "",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 8),

                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 4),
                            Text("${product.rating ?? 0}"),
                          ],
                        ),

                        SizedBox(height: 12),

                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 12),

                        /// Stock
                        Text(
                          (product.stock ?? 0) > 0
                              ? "In Stock (${product.stock})"
                              : "Out of Stock",
                          style: TextStyle(
                            color: (product.stock ?? 0) > 0
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 20),

                        /// Description
                        Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),

                        SizedBox(height: 8),

                        Text(
                          product.description ?? "",
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),

                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    bool isInCart = false;

                    if (state is CartUpdated) {
                      isInCart = state.products.contains(product);
                    }

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isInCart ? Colors.red : Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          if (isInCart) {
                            context.read<CartCubit>().removeFromCart(product);
                          } else {
                            context.read<CartCubit>().addToCart(product);
                          }
                        },
                        child: Text(
                          isInCart ? "Remove from Cart" : "Add to Cart",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return DefaultWidget(text: "Something went wrong");
        },
      ),
    );
  }
}
