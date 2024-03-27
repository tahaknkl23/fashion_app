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

class Buton {
  static ElevatedButton homeButton({required String buttonText, required VoidCallback onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.transparent, // Butonun yazı rengi
        elevation: 0, // Butonun yükseltisi (gölgelenme) olmayacak
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(buttonText),
    );
  }
}
