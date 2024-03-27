import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(Imageurll.home, fit: BoxFit.cover)),
        const Positioned(
          top: 200,
          left: 60,
          child: Text(
            'LUXURY ',
            style: TextStyle(
              color: AppColors.brownColor,
              fontSize: 40,
              letterSpacing: 8,
              fontWeight: FontWeight.bold,
              fontFamily: 'Bodoni',
            ),
          ),
        ),
        const Positioned(
          top: 240,
          left: 80,
          child: Text(
            'FASHİON',
            style: TextStyle(color: AppColors.brownColor, fontSize: 40, letterSpacing: 4, fontWeight: FontWeight.bold, fontFamily: 'Bodoni'),
          ),
        ),
        const Positioned(
          top: 280,
          left: 40,
          child: Text(
            '& ACCESSORİES',
            style: TextStyle(color: AppColors.brownColor, fontSize: 40, letterSpacing: 2, fontWeight: FontWeight.bold, fontFamily: 'Bodoni'),
          ),
        ),
        //   En alta buton
        Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black12,
              padding: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              "EXPLORE COLLECTION",
              style: TextStyle(
                color: AppColors.brownColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
