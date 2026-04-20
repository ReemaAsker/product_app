import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';
import 'package:shop_app/features/product/screens/widgets/custom_app_bar.dart';

import '../../../core/widgets/custom_image_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(ProductRepository())..fetchSingleProduct(productId),
      child: Scaffold(
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
              final imageUrl =
                  product.thumbnail ??
                  (product.images?.isNotEmpty == true
                      ? product.images!.first
                      : null);

              return Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey[100],
                    child: imageUrl == null
                        ? Image.asset(
                            AppConstatnts.errorImg,
                            fit: BoxFit.contain,
                          )
                        : CustomImageWidget(imgUrl: imageUrl),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView(
                        children: [
                          Text(
                            product.title ?? "",
                            style: AppConstatnts.productStyle,
                          ),

                          SizedBox(height: 8),

                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: AppConstatnts.primaryColor,
                              ),
                              SizedBox(width: 4),
                              Text("${product.rating ?? 0}"),
                            ],
                          ),

                          SizedBox(height: 12),

                          Text(
                            "\$${product.price}",
                            style: AppConstatnts.productStyle,
                          ),

                          SizedBox(height: 12),

                          Text(
                            (product.stock ?? 0) > 0
                                ? "In Stock (${product.stock})"
                                : "Out of Stock",
                            style: TextStyle(
                              color: (product.stock ?? 0) > 0
                                  ? AppConstatnts.secoundryColor
                                  : AppConstatnts.errorColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          SizedBox(height: 20),

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
                            // style: TextStyle(height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),

                  BlocBuilder<CartCubit, CartState>(
                    builder: (context, state) {
                      final isInCart = state.maybeWhen(
                        updated: (products, _) => products.contains(product),
                        orElse: () => false,
                      );

                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isInCart
                                ? AppConstatnts.errorColor
                                : AppConstatnts.secoundryColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          onPressed: () {
                            final cubit = context.read<CartCubit>();

                            if (isInCart) {
                              cubit.removeFromCart(product);
                            } else {
                              cubit.addToCart(product);
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
      ),
    );
  }
}
