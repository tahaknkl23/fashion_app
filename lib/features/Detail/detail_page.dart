import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/appbar.dart';
import 'package:fashion_app/config/widgets/drawer.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

final PageController _scrollController = PageController(
  initialPage: 0,
);
int currentIndex = 0;
void changePage(int index) {
  _scrollController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.bounceInOut);
}

class _DetailPageState extends State<DetailPage> {
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
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 450.12,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
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
                          Expanded(child: Image.asset(ImageConstants.detailone.toPng, fit: BoxFit.fill)),
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
                for (int i = 0; i < 5; i++)
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
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "MOHAN",
                      style: TextStyle(
                        fontFamily: "Teros",
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
