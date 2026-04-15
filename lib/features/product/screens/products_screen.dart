import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/data/product.dart';

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
            return Center(child: Text(state.message));
          }
          if (state is ProductSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                Product product = state.products[index];
                return ListTile(
                  leading: Image.network(state.products[index].images![0]),
                  title: Text(product.title ?? ""),
                  subtitle: Text(product.description ?? ""),
                  trailing: Text("${product.price ?? 0.0} \$"),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
