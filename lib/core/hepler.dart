import 'package:flutter/material.dart';

class AppConstatnts {
  static String errorImg = "assets/fail_product_loading.png";
  static String loadingImg = "assets/loading.gif";
  static Color primaryColor = Colors.amber;
  static Color lightPrimaryColor = Color(0xFFF4B755);
  static Color secoundryColor = Colors.blue;
  static Color errorColor = Colors.red;
  static TextStyle whiteText = TextStyle(color: Colors.white);
  static TextStyle defaultStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );
  static TextStyle productStyle = TextStyle(
    fontSize: 22,
    color: AppConstatnts.secoundryColor,
    fontWeight: FontWeight.bold,
  );
}
