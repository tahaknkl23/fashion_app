import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/widgets/Appbar.dart';
import 'package:fashion_app/config/widgets/Drawer.dart';
import 'package:fashion_app/features/home/home_theme/button_theme.dart';
import 'package:flutter/material.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(),
      drawer: const Drawer(
        child: DraweWidget(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  const Text(
                    "Blog",
                    style: TextStyle(fontSize: 20, color: AppColors.blackColor, letterSpacing: 5),
                    textAlign: TextAlign.center,
                  ),
                  Image.asset(Imageurll.divider),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                BlogButton.blogButton(buttonText: "Fashion"),
                BlogButton.blogButton(buttonText: "Promo"),
                BlogButton.blogButton(buttonText: "Policy"),
                BlogButton.blogButton(buttonText: "Lookbook"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
