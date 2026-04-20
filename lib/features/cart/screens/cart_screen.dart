import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';

import 'widgets/cart_item_card.dart';
import 'widgets/total_chekout_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Cart"), centerTitle: true),

      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            initial: () =>
                const Center(child: DefaultWidget(text: "Your cart is empty")),

            loading: () =>
                Center(child: Image.asset(AppConstatnts.loadingImg, width: 80)),

            checkoutSuccess: (total) => Center(
              child: Text(
                "Checkout Success\nTotal: \$${total.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),

            updated: (items, totalPrice) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: items.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),

                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CartItemCard(item: item);
                      },
                    ),
                  ),

                  TotalChekoutWidget(total: totalPrice),
                ],
              );
            },

            error: (msg) => Center(child: Text(msg)),

            orElse: () => const DefaultWidget(text: "Something went wrong"),
          );
        },
      ),
    );
  }
}
