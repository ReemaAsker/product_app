import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'package:shop_app/features/product/screens/widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  final String categoreySlug;
  const ProductsScreen({super.key, required this.categoreySlug});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductCubit>().fetchByCategory(widget.categoreySlug);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"), centerTitle: true),

      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is ProductError) {
            return DefaultWidget(text: state.message);
          }
          if (state is ProductSuccess) {
            return GridView.builder(
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                Product product = state.products[index];
                return ProductCard(product: product);
              },
            );
          }
          return DefaultWidget(text: "Something went wrong");
        },
      ),
    );
  }
}
