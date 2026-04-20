import 'package:flutter/material.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/features/product/data/product.dart';
import 'package:shop_app/features/product/screens/product_screen_details.dart';
import 'package:shop_app/core/widgets/custom_image_widget.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        product.thumbnail ??
        (product.images?.isNotEmpty == true ? product.images!.first : null);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),

        onTap: product.id == null
            ? null
            : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProductDetailsScreen(productId: product.id!),
                  ),
                );
              },

        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            color: AppConstatnts.lightPrimaryColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: imageUrl == null
                              ? Image.asset(
                                  AppConstatnts.loadingImg,
                                  fit: BoxFit.contain,
                                )
                              : CustomImageWidget(imgUrl: imageUrl),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Expanded(
                        flex: 1,
                        child: Text(
                          product.title ?? "No title",
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: _Badge(
                    color: AppConstatnts.primaryColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(12),
                    ),
                    text: "${(product.price ?? 0).toStringAsFixed(2)} \$",
                  ),
                ),

                Positioned(
                  top: 0,
                  left: 0,
                  child: _Badge(
                    color: AppConstatnts.secoundryColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    text: product.availabilityStatus ?? "Unknown",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final Color color;
  final BorderRadius borderRadius;
  final String text;

  const _Badge({
    required this.color,
    required this.borderRadius,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: Text(text, style: AppConstatnts.whiteText),
    );
  }
}
