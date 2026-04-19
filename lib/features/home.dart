import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/category/bloc/category_cubit.dart';
import 'package:shop_app/features/category/bloc/category_state.dart';
import 'package:shop_app/features/category/screens/widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return state.when(
              initial: () => DefaultWidget(text: "Start loading categories"),

              loading: () => const Center(child: CircularProgressIndicator()),

              success: (categories) {
                return GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
    );
  }
}
