import 'package:flutter/material.dart';
import 'package:shop_app/core/hepler.dart';
import 'package:shop_app/features/category/data/category.dart';
import 'package:shop_app/features/product/screens/products_screen.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsScreen(categoreySlug: category.slug),
          ),
        );
      },
      child: Container(
        width: 100,

        decoration: BoxDecoration(
          color: AppConstatnts.lightPrimaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 40, color: AppConstatnts.secoundryColor),
            SizedBox(height: 10),
            Text(category.name, style: AppConstatnts.defaultStyle),
          ],
        ),
      ),
    );
  }
}
