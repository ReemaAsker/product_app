import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';
import 'package:shop_app/features/cart/screens/cart_screen.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          state.maybeWhen(
            loading: () => Center(child: Image.asset(AppConstatnts.loadingImg)),
            error: (message) => Center(child: Text(message)),
            productSuccess: (product) => Text(product.title ?? ""),
            orElse: () => Text(""),
          );
          return Text("Product");
        },
      ),
      centerTitle: true,
      actions: [
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            final itemCount = state.maybeWhen(
              updated: (products, _) => products.length,
              orElse: () => 0,
            );

            return Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                ),

                if (itemCount > 0)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppConstatnts.errorColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        itemCount.toString(),
                        style: AppConstatnts.whiteText,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
