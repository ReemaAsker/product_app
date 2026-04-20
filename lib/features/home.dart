import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/category/bloc/category_cubit.dart';
import 'package:shop_app/features/category/bloc/category_state.dart';
import 'package:shop_app/features/category/screens/widgets/category_card.dart';

import 'product/repo/product_repo.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryCubit(ProductRepository())..fetchCategories(),
      child: Scaffold(
        appBar: AppBar(title: Text("Categories"), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              return state.when(
                initial: () => DefaultWidget(text: "Start loading categories"),

                loading: () =>
                    Center(child: Image.asset(AppConstatnts.loadingImg)),

                success: (categories) {
                  return GridView.builder(
                    itemCount: categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemBuilder: (context, index) {
                      return CategoryCard(category: categories[index]);
                    },
                  );
                },

                error: (message) => DefaultWidget(text: message),
              );
            },
          ),
        ),
      ),
    );
  }
}
