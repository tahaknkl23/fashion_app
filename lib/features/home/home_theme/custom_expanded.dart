import 'package:fashion_app/config/items/app_colors.dart';
import 'package:flutter/material.dart';

class CustomExpandedColumn extends StatelessWidget {
  final String imagePath;
  final String text;

  const CustomExpandedColumn({
    super.key,
    required this.imagePath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 100, // Resmin genişliğini istediğiniz gibi ayarlayabilirsiniz
            height: 100, // Resmin yüksekliğini istediğiniz gibi ayarlayabilirsiniz
          ),
          const SizedBox(height: 8), // Resim ile metin arasındaki boşluğu artırın
          Text(
            text,
            style: const TextStyle(
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
