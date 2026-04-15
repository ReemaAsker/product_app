import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/features/category/bloc/category_cubit.dart';
import 'package:shop_app/features/home_copy.dart';
import 'package:shop_app/features/home.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit(ProductRepository())),
        BlocProvider(create: (_) => CategoryCubit(ProductRepository())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen2(),
      ),
    );
  }
}
