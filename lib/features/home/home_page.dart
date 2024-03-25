import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/widgets/Appbar.dart';
import 'package:fashion_app/config/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final PageController _scrollController = PageController();
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      FirstPage(
        onPressed: () {
          setState(() {
            _scrollController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
          });
        },
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'NEW ARRİVAL',
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Bodoni',
                ),
              ),
            ),
            Image.asset(Imageurll.divider),
          ],
        ),
      ),
    ];
    return Scaffold(
      appBar: currentIndex == 0 ? const AppbarWidget() : null,
      drawer: const Drawer(
        child: DraweWidget(),
      ),
      body: PageView.builder(
        controller: _scrollController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: pages.length,
        itemBuilder: (context, index) {
          return pages[currentIndex];
        },
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({
    super.key,
    required this.onPressed,
  });
  final Function() onPressed;

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
            onPressed: onPressed,
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
