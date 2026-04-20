import 'package:flutter/material.dart';

import '../../../../core/hepler.dart';

class ProductStock extends StatelessWidget {
  final int stock;
  const ProductStock({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: stock > 0
            ? Colors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        stock > 0 ? " (${stock})" : "Out of Stock",
        style: TextStyle(
          color: stock > 0
              ? AppConstatnts.secoundryColor
              : AppConstatnts.errorColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
