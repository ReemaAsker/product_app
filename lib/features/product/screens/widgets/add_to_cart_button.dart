import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/data/cartItem.dart';
import 'package:shop_app/features/product/data/product.dart';

import '../../../../core/hepler.dart';
import '../../../cart/bloc/cart_cubit.dart';
import '../../../cart/bloc/cart_state.dart';

class AddToCartButton extends StatelessWidget {
  final Product product;

  const AddToCartButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CartCubit, CartState, bool>(
      selector: (state) {
        return state.maybeWhen(
          updated: (items, _) => items.any((e) => e.product.id == product.id),
          orElse: () => false,
        );
      },

      builder: (context, isInCart) {
        final cubit = context.read<CartCubit>();

        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,

            child: ElevatedButton(
              onPressed: () {
                if (isInCart) {
                  cubit.deleteItem(product); // حذف كامل
                } else {
                  cubit.addToCart(product);
                }
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: isInCart
                    ? AppConstatnts.errorColor
                    : AppConstatnts.secoundryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isInCart
                        ? Icons.remove_shopping_cart
                        : Icons.add_shopping_cart,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isInCart ? "Remove from Cart" : "Add to Cart",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
