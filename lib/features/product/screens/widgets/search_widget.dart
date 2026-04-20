import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
      child: TextField(
        onChanged: (value) =>
            context.read<ProductCubit>().searchOfProducts(value),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: "Search",
        ),
      ),
    );
  }
}
