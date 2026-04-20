import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_image_widget.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return state.maybeWhen(
            updated: (products, totalPrice) {
              if (products.isEmpty) return const SizedBox();

              return Container(
                width: double.infinity,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),

                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "${totalPrice.toStringAsFixed(2)}\$",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(width: 20),

                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.purple,
                            ),
                          ),
                          onPressed: () {
                            context.read<CartCubit>().checkout();
                          },
                          child: const Text(
                            "Checkout",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },

            orElse: () => const SizedBox(),
          );
        },
      ),
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

                  return Dismissible(
                    key: Key(product.id.toString()),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) {
                      context.read<CartCubit>().removeFromCart(product);
                    },
                    background: const SizedBox(),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),

                    child: ListTile(
                      leading: imageUrl == null
                          ? Image.asset(
                              "assets/fail_product_loading.png",
                              fit: BoxFit.contain,
                            )
                          : CustomImageWidget(imgUrl: imageUrl),
                      title: Text(product.title!),
                      subtitle: Text("\$${product.price}"),
                    ),
                  );
                },
              );
            },

            loading: () => const Center(child: CircularProgressIndicator()),

            checkoutSuccess: (total) =>
                Center(child: Text("Checkout success! Total: $total")),

            error: (message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}
