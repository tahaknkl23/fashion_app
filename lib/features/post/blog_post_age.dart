import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/appbar.dart';
import 'package:fashion_app/config/widgets/drawer.dart';
import 'package:fashion_app/config/widgets/iletisim.dart';
import 'package:fashion_app/features/home/home_theme/button_theme.dart';
import 'package:flutter/material.dart';

class BlogPostPage extends StatefulWidget {
  const BlogPostPage({Key? key}) : super(key: key);

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  final PageController _scrollController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;
  void changePage(int index) {
    _scrollController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut);
  }

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
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                ImageConstants.rectangleone.toPng,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("2021 STYLE GUİDE: THE BİGGEST FALL TRENDS", style: TextStyle(fontSize: 15, fontFamily: "Tenor", fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                "You guys know how much I love mixing high and low-end – it’s the best way to get the most bang for your buck while still elevating your wardrobe. The same goes for handbags! And honestly they are probably the best pieces to mix and match. I truly think the key to completing a look is with a great bag and I found so many this year that I wanted to share a round-up of my most worn handbags.",
                style: TextStyle(fontSize: 18, fontFamily: "Tenor"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 450.12,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        changePage(index);
                      },
                      child: Column(
                        children: [
                          Expanded(child: Image.asset(ImageConstants.blogtwo.toPng, fit: BoxFit.fill)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Transform.rotate(
                    angle: 0.75,
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: currentIndex == i ? AppColors.blackColor : Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const Text(
                  "I found this Saint Laurent canvas handbag this summer and immediately fell in love. The neutral fabrics are so beautiful and I like how this handbag can also carry into fall. The mini Fendi bucket bag with the sheer fabric is so fun and such a statement bag. Also this DeMellier off white bag is so cute to carry to a dinner with you or going out, it’s small but not too small to fit your phone and keys still.",
                  style: TextStyle(fontSize: 18, fontFamily: "Tenor")),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Posted by OpenFashion | ",
                  style: TextStyle(fontSize: 18, fontFamily: "Tenor"),
                ),
                Text("3 Days Ago", style: TextStyle(fontSize: 18, fontFamily: "Tenor")),
              ],
            ),
            Row(
              children: [
                Buton.homeButton(buttonText: "#Fashion", onPressed: () {}),
                Buton.homeButton(buttonText: "#Tips", onPressed: () {}),
              ],
            ),
            const Iletisim(),
          ],
        ),
      ),
    );
  }
}
