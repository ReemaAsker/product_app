import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/core/widgets/counter_widget.dart';
import 'package:shop_app/core/widgets/default_widget.dart';
import 'package:shop_app/features/product/bloc/product_cubit.dart';
import 'package:shop_app/features/product/bloc/product_state.dart';
import 'package:shop_app/features/product/repo/product_repo.dart';
import 'package:shop_app/features/product/screens/widgets/custom_app_bar.dart';
import 'package:shop_app/features/product/screens/widgets/images_gallery.dart';
import 'package:shop_app/features/product/screens/widgets/product_price.dart';
import 'package:shop_app/features/product/screens/widgets/product_rating.dart';
import 'package:shop_app/features/product/screens/widgets/product_stock.dart';

import '../../../core/widgets/custom_image_widget.dart';
import 'widgets/add_to_cart_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  String? selectedImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ProductCubit(ProductRepository())
            ..fetchSingleProduct(widget.productId),

      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(),
        ),

        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            return state.maybeWhen(
              loading: () =>
                  Center(child: Image.asset(AppConstatnts.loadingImg)),

              productSuccess: (product) {
                final images = product.images ?? [];

                selectedImage ??=
                    product.thumbnail ??
                    (images.isNotEmpty ? images.first : null);

                return Column(
                  children: [
                    Container(
                      height: 280,
                      width: double.infinity,
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.antiAlias,

                      child: selectedImage == null
                          ? Image.asset(
                              AppConstatnts.errorImg,
                              fit: BoxFit.contain,
                            )
                          : AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: CustomImageWidget(
                                key: ValueKey(selectedImage),
                                imgUrl: selectedImage ?? images.first,
                              ),
                            ),
                    ),

                    if (images.isNotEmpty)
                      ProductImagesGallery(
                        onImageSelected: (image) => setState(() {
                          selectedImage = image;
                        }),
                        selectedImage: selectedImage ?? images.first,
                        images: images,
                      ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        child: ListView(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    product.title ?? "",
                                    style: AppConstatnts.productStyle.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                                const SizedBox(width: 10),

                                ProductPrice(price: product.price ?? 0.0),
                              ],
                            ),

                            const SizedBox(height: 12),

                            ProductRating(rating: product.rating ?? 0.0),

                            const SizedBox(height: 12),

                            ProductStock(stock: product.stock ?? 0),
                            const SizedBox(height: 20),

                            const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              product.description ?? "",
                              style: const TextStyle(
                                height: 1.5,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AddToCartButton(product: product),
                        ),
                        Expanded(
                          child: CounterWidget(
                            value: 1,
                            onDecrement: () => {},
                            onIncrement: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },

              error: (message) => DefaultWidget(text: message),

              orElse: () => const DefaultWidget(text: "Something error"),
            );
          },
        ),
      ),
    );
  }
}
