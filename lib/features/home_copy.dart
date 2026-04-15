import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/category/bloc/category_cubit.dart';
import 'package:shop_app/features/category/bloc/category_state.dart';
import 'package:shop_app/features/category/screens/widgets/category_card.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';

class HomeScreen2 extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen2> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"), centerTitle: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is CategoryLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is CategoryError) {
                  return Center(child: Text(state.message));
                }

                if (state is CategorySuccess) {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categories.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          context.read<ProductCubit>().fetchByCategory(
                            state.categories[index].slug!,
                          );
                        },
                        child: CategoryCard(category: state.categories[index]),
                      );
                    },
                  );
                }

                return SizedBox();
              },
            ),
          ),
          Divider(color: Colors.amber),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(child: CircularProgressIndicator());
                }

                if (state is ProductError) {
                  return Center(child: Text(state.message));
                }

                if (state is ProductSuccess) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),

                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return ListTile(
                          leading: Image.network(product.images![0]),
                          title: Text(product.title ?? ""),
                          subtitle: Text(product.description ?? ""),
                          trailing: Text("${product.price ?? 0.0} \$"),
                        );
                      },
                    ),
                  );
                }

                return Center(child: Text("Select a category"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
