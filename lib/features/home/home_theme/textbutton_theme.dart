import 'package:fashion_app/config/items/app_colors.dart';
import 'package:flutter/material.dart';

class TexbuttonTheme {
  static const TextStyle textButton = TextStyle(color: AppColors.blackColor, fontSize: 16, fontWeight: FontWeight.bold);
}

TextButton textbuttonThemeHome(String text) {
  return TextButton(
    onPressed: () {},
    child: Text(
      text,
      style: TexbuttonTheme.textButton,
    ),
  );
}
