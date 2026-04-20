import 'package:flutter/material.dart';

class ProductRating extends StatelessWidget {
  final double rating;
  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 4),
        Text("$rating"),
      ],
    );
  }
}
