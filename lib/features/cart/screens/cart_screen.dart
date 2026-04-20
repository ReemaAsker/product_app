import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';
import 'package:shop_app/features/cart/screens/widgets/cart_item.dart';
import 'package:shop_app/features/cart/screens/widgets/custom_bottom_nav_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      bottomNavigationBar: CustomBottomNavBar(),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () =>
                Center(child: DefaultWidget(text: "No items in cart")),

            updated: (products, totalPrice) {
              return ListView.separated(
                itemCount: products.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final product = products[index];
                  final imageUrl =
                      product.thumbnail ??
                      (product.images?.isNotEmpty == true
                          ? product.images!.first
                          : null);

                  return CartItem(product: product, img: imageUrl);
                },
              );
            },

            loading: () => Center(child: Image.asset(AppConstatnts.loadingImg)),

            checkoutSuccess: (total) =>
                Center(child: Text("Checkout success! Total: $total")),

            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
