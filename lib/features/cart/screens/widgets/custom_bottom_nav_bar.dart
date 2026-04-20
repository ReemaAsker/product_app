import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
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
                        style: AppConstatnts.whiteText,
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
                            AppConstatnts.secoundryColor,
                          ),
                        ),
                        onPressed: () {
                          context.read<CartCubit>().checkout();
                        },
                        child: Text("Checkout", style: AppConstatnts.whiteText),
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
    );
  }
}
