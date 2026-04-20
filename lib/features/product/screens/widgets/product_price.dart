import 'package:flutter/material.dart';
import 'package:shop_app/core/hepler.dart';

class ProductPrice extends StatelessWidget {
  final double price;
  const ProductPrice({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppConstatnts.secoundryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        "\$$price",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
