import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/features/cart/bloc/cart_cubit.dart';

import '../../../../core/widgets/custom_image_widget.dart';
import '../../../product/data/product.dart';

class CartItem extends StatelessWidget {
  final Product product;
  final String? img;
  const CartItem({super.key, required this.product, required this.img});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        context.read<CartCubit>().removeFromCart(product);
      },
      background: const SizedBox(),
      secondaryBackground: Container(
        color: AppConstatnts.errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),

      child: ListTile(
        leading: img == null
            ? Image.asset(AppConstatnts.loadingImg, fit: BoxFit.contain)
            : CustomImageWidget(imgUrl: img!),
        title: Text(product.title!),
        subtitle: Text("\$${product.price}"),
      ),
    );
  }
}
