import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/product/data/product.dart';

import '../../../../core/hepler.dart';
import '../../../cart/bloc/cart_cubit.dart';
import '../../../cart/bloc/cart_state.dart';

class AddToCartButton extends StatelessWidget {
  Product product;
  AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
