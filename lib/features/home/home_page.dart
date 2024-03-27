import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/Appbar.dart';
import 'package:fashion_app/config/widgets/Drawer.dart';
import 'package:fashion_app/features/home/home_theme/textbutton_theme.dart';
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
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'NEW ARRİVAL',
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Bodoni',
                    ),
                  ),
                  Image.asset(Imageurll.divider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      textbuttonThemeHome("ALL"),
                      textbuttonThemeHome("APPAREL"),
                      textbuttonThemeHome("DRESS"),
                      textbuttonThemeHome("TSHIRT"),
                      textbuttonThemeHome("BAG"),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: Column(
                          children: [
                            Image.asset(ImageConstants.productOne.toPng, fit: BoxFit.cover),
                            const Text(
                              "21WN reversible angora cardigan",
                              textAlign: TextAlign.center,
                            ),
                            const Text(
                              "\$120",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            AppRouteNames.categorypage;
                          },
                          child: const Text(
                            "Explore More",
                            style: TextStyle(color: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.bold),
                          )),
                      const Icon(
                        Icons.arrow_forward_outlined,
                        color: AppColors.blackColor,
                        size: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(Imageurll.divider),
                  const SizedBox(
                    height: 20,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      List<ImageConstants> images = [
                        ImageConstants.prada,
                        ImageConstants.boss,
                        ImageConstants.catier,
                        ImageConstants.gucci,
                        ImageConstants.tifanniy,
                        ImageConstants.burberry
                      ];
                      return SizedBox(
                        child: Column(
                          children: [
                            Image.asset(images[index].toPng, fit: BoxFit.cover),
                          ],
                        ),
                      );
                    },
                  ),
                  Image.asset(Imageurll.divider),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'COLLECTIONS',
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 20,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Bodoni',
                      ),
                    ),
                  ),
                  Image.asset(ImageConstants.topone.toPng, fit: BoxFit.cover),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(ImageConstants.toptwo.toPng, fit: BoxFit.cover),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(ImageConstants.topthree.toPng, fit: BoxFit.cover),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("JUST FOR YOU",
                      style:
                          TextStyle(color: AppColors.blackColor, fontSize: 20, letterSpacing: 4, fontWeight: FontWeight.bold, fontFamily: 'Bodoni')),
                  Image.asset(Imageurll.divider),
                ],
              ),
            ),
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
