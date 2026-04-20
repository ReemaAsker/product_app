import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final String imgUrl;
  const CustomImageWidget({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgUrl,

      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Center(
          child: SizedBox(
            width: 30,
            height: 30,
            child: Image.asset('assets/loading.gif'),
          ),
        );
      },

      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          "assets/fail_product_loading.png",
          fit: BoxFit.contain,
        );
      },
    );
  }
}
