import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/appbar.dart';
import 'package:fashion_app/config/widgets/drawer.dart';
import 'package:fashion_app/features/Detail/widget/detail_page_widget.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "MOHAN",
                        style: containerTextstyle.textstyle,
                        textAlign: TextAlign.right,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.ios_share_rounded),
                      ),
                    ],
                  ),
                  const Text(
                    "Recycle Boucle Knit Cardigan Pink",
                    style: containerTextstyle.textstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "\$120",
                        style: TextStyle(
                          color: AppColors.orengeColor,
                          fontSize: 22,
                        ), // You can adjust the style as needed
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Color",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BuildColorButton.buildColorButton(Colors.black),
                      const SizedBox(width: 8),
                      BuildColorButton.buildColorButton(Colors.orange),
                      const SizedBox(width: 8),
                      BuildColorButton.buildColorButton(Colors.grey),
                      const SizedBox(width: 8),
                      const Text(
                        "Size",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BuildSizeButton.buildSizeButton("S"),
                      BuildSizeButton.buildSizeButton("M"),
                      BuildSizeButton.buildSizeButton("L"),
                    ],
                  ),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: Row(
                      mainAxisSize: MainAxisSize.min, // Yalnızca içerik kadar alan kapla
                      children: const [
                        Text(
                          "ADD TO BASKET",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 8), // İçerikler arasında boşluk bırak
                        Icon(Icons.add),
                      ],
                    ),
                    icon: const Icon(Icons.favorite_border),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
