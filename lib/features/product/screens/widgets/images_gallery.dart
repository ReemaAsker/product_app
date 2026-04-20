import 'package:flutter/material.dart';
import 'package:shop_app/core/hepler.dart';

class ProductImagesGallery extends StatelessWidget {
  final List<String> images;
  final String selectedImage;
  final ValueChanged<String> onImageSelected;
  const ProductImagesGallery({
    super.key,
    required this.selectedImage,
    required this.onImageSelected,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          padding: const EdgeInsets.symmetric(horizontal: 12),

          itemBuilder: (context, index) {
            final img = images[index];
            final isSelected = img == selectedImage;

            return GestureDetector(
              onTap: () => onImageSelected(img),

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? AppConstatnts.secoundryColor
                        : Colors.transparent,
                    width: 2,
                  ),
                ),

                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    img,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
