import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/hepler.dart';
import '../../bloc/cart_cubit.dart';

class TotalChekoutWidget extends StatelessWidget {
  final double total;

  const TotalChekoutWidget({required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.grey.withOpacity(0.1)),
        ],
      ),

      child: Row(
        children: [
          Expanded(
            child: Text(
              "Total: \$${total.toStringAsFixed(2)}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppConstatnts.secoundryColor,
              ),
            ),
          ),

          ElevatedButton(
            onPressed: () => context.read<CartCubit>().checkout(),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstatnts.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: const Text(
              "Checkout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
