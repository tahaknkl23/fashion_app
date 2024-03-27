import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/features/home/home_theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/widgets/Appbar.dart';
import 'package:fashion_app/config/widgets/Drawer.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final List<String> blogItems = [
    "Fashion",
    "Promo",
    "Policy",
    "Lookbook",
    "Beauty",
    "Lifestyle",
  ];
  void _handleItemClick(String item) {
    print("Clicked on $item");
  }

  final List<Map<String, dynamic>> blogItemstwo = [
    {"title": "Fashion", "image": ImageConstants.rectangleone.toPng},
    {"title": "Promo", "image": ImageConstants.rectangletwo.toPng},
    {"title": "Policy", "image": ImageConstants.rectanglethree.toPng},
    {"title": "Lookbook", "image": ImageConstants.rectanglefour.toPng},
  ];

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
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        _handleItemClick(blogItems[index]);
                      },
                      child: SizedBox(
                        width: 100,
                        child: Center(
                          child: Text(
                            blogItems[index],
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: blogItemstwo.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(blogItemstwo[index]["image"]),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(onPressed: () {}, icon: const Icon(Icons.save, color: AppColors.whiteColor, size: 30)),
                            ),
                            Positioned(
                              bottom: 10,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text("2021 Style Guide: The Biggest",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: AppColors.whiteColor,
                                      )),
                                  Text("Fall Trends", style: TextStyle(fontSize: 15, color: AppColors.whiteColor))
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Buton.homeButton(buttonText: "#Fashion", onPressed: () {}),
                            Buton.homeButton(buttonText: "#Tips", onPressed: () {}),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
