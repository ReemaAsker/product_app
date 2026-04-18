import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';
import 'package:shop_app/features/cart/bloc/cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartUpdated) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: state.products.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) => ListTile(
                    leading: Image.network(state.products[index].images![0]),
                    title: Text(state.products[index].title!),
                    subtitle: Text("\$${state.products[index].price}"),
                  ),
                );
              }

              return DefaultWidget(text: "Something went wrong");
            },
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.purple),
            ),
            onPressed: () {},
            child: Text("Checkout", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
