import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state is CategoryError) {
              return Center(child: Text(state.message));
            }

            if (state is CategorySuccess) {
              return GridView.builder(
                itemCount: state.categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  return CategoryCard(category: state.categories[index]);
                },
              );
            }

            return SizedBox();
          },
        ),
      ),
    );
  }
}
