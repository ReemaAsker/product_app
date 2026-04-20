import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';
import 'package:shop_app/features/product/screens/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  final String categoreySlug;
  const ProductsScreen({super.key, required this.categoreySlug});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductCubit(ProductRepository())..fetchByCategory(categoreySlug),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Products of $categoreySlug"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 12,
              ),
              child: TextField(
                onChanged: (value) =>
                    context.read<ProductCubit>().searchOfProducts(value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: "Search",
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<ProductCubit, ProductState>(
                buildWhen: (previous, current) => previous != current,

                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),

                    productsSuccess: (products) {
                      if (products.isEmpty) {
                        return const DefaultWidget(text: "No products found");
                      }

                      return GridView.builder(
                        cacheExtent: 500,
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                        itemBuilder: (context, index) {
                          final Product product = products[index];
                          return ProductCard(product: product);
                        },
                      );
                    },

                    error: (message) => DefaultWidget(text: message),

                    orElse: () =>
                        const DefaultWidget(text: "Something went wrong"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
