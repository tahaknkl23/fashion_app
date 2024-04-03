import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/iletisim.dart';
import 'package:fashion_app/features/home/home_theme/button_theme.dart';
import 'package:flutter/material.dart';
import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/widgets/appbar.dart';
import 'package:fashion_app/config/widgets/drawer.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  final List<String> blogItems = [
    "Fashion",
    "Promos",
    "Policy",
    "Lookbook",
    "Beauty",
    "Lifestyle",
  ];
  void _handleItemClick(String item) {}

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
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: blogItemstwo.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          AspectRatio(
                            aspectRatio: 1.7,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, AppRouteNames.postpage);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      blogItemstwo[index]["image"],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              onPressed: () {},
                              icon: Image(
                                image: AssetImage(
                                  ImageConstants.save.toPng,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black45,
                                  Colors.black,
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: const [
                                Text(
                                  "2021 Style Guide: The Biggest Fall Trends",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: AppColors.whiteColor,
                                    fontFamily: "Tenor",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Buton.homeButton(buttonText: "#Fashion", onPressed: () {}),
                          Buton.homeButton(
                            buttonText: "#Tips",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRouteNames.homepage);
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.transparent),
                    ),
                    child: const Text(
                      "Load More",
                      style: TextStyle(color: AppColors.blackColor),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.blackColor,
                    size: 30,
                  )
                ],
              ),
            ),
            const Iletisim(),
          ],
        ),
      ),
    );
  }
}
