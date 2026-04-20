import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/data/cartItem.dart';

import '../../../../core/hepler.dart';
import 'qty_button.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;

  const CartItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    final imageUrl =
        product.thumbnail ??
        (product.images?.isNotEmpty == true ? product.images!.first : null);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 8, color: Colors.grey.withOpacity(0.1)),
        ],
      ),

      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: imageUrl == null
                ? Image.asset(AppConstatnts.errorImg, width: 70, height: 70)
                : Image.network(
                    imageUrl,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 6),

                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    color: AppConstatnts.secoundryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: [
              QtyButton(
                icon: Icons.add,
                onTap: () => context.read<CartCubit>().addToCart(product),
              ),

              Text("${item.quantity}"),

              QtyButton(
                icon: Icons.remove,
                onTap: () => context.read<CartCubit>().removeFromCart(product),
              ),
            ],
          ),

          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => context.read<CartCubit>().deleteItem(product),
          ),
        ],
      ),
    );
  }
}
