import 'package:flutter/material.dart';
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
          margin: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFF4B755),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),

          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    /// IMAGE
                    Expanded(
                      child: imageUrl == null
                          ? Image.asset(
                              "assets/fail_product_loading.png",
                              fit: BoxFit.contain,
                            )
                          : CustomImageWidget(imgUrl: imageUrl),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      product.title ?? "No title",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                  child: Text(
                    "${(product.price ?? 0).toStringAsFixed(2)} \$",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(16),
                      topLeft: Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    product.availabilityStatus ?? "Unknown",
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
