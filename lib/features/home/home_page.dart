// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/appbar.dart';
import 'package:fashion_app/config/widgets/drawer.dart';
import 'package:fashion_app/config/widgets/iletisim.dart';
import 'package:fashion_app/features/Detail/detail_page.dart';
import 'package:fashion_app/features/home/home_onboarding.dart';
import 'package:fashion_app/features/home/home_theme/button_theme.dart';
import 'package:fashion_app/features/home/home_theme/custom_expanded.dart';
import 'package:fashion_app/models/dress_model.dart';
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
      const SecondPage(),
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

class SecondPage extends StatefulWidget {
  const SecondPage({
    super.key,
  });

  @override
  State<SecondPage> createState() => _SecondPageState();
}

String _type = "";

class _SecondPageState extends State<SecondPage> {
  final PageController _scrollController = PageController(
    initialPage: 0,
    viewportFraction: 0.7,
  );
  int currentIndex = 0;
  double transformValue = 0;

  Future<QuerySnapshot<Map<String, dynamic>>> getReguest() async {
    if (_type == "") {
      final snaps = await FirebaseFirestore.instance.collection("dreeses").get();
      return snaps;
    } else {
      final snaps = await FirebaseFirestore.instance.collection("dreeses").where("type", isEqualTo: _type).get();
      return snaps;
    }
  }

  void changePage(int index) {
    _scrollController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    textbuttonThemeHome("ALL", () {
                      setState(() {
                        _type = "";
                      });
                    }),
                    textbuttonThemeHome("APPAREL", () {
                      setState(() {
                        _type = "apparel";
                      });
                    }),
                    textbuttonThemeHome("DRESS", () {
                      setState(() {
                        _type = "dress";
                      });
                    }),
                    textbuttonThemeHome("TSHIRT", () {
                      setState(() {
                        _type = "tshirt";
                      });
                    }),
                    textbuttonThemeHome("BAG", () {
                      setState(() {
                        _type = "bag";
                      });
                    }),
                  ],
                ),
                // ElevatedButton(
                //     onPressed: () async {
                //       final response = await FirebaseFirestore.instance.collection("dreeses").get();
                //       print(response.docs[0].data()["price"]);
                //     },
                //     child: const Text("Explore More")),
                // ElevatedButton(
                //     onPressed: () async {
                //       final response = await FirebaseFirestore.instance.collection("dreeses").get();
                //       print(response.docs[0].data());
                //       final model = DressModel.fromMap(response.docs[0].data());
                //       print(model.description);

                //       final model = DressModel(description: "vahan", imageUrl: "daşllskdls", price: 12, title: "doaoksoş", type: "dlkasml");
                //       print(model.toMap());
                //       await FirebaseFirestore.instance.collection("dreeses").add(model.toMap());
                //     },
                //     child: const Text("Explore More")),
                FutureBuilder(
                  future: getReguest(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text("Error");
                    } else if (snapshot.hasData) {
                      final response = snapshot.data;
                      if (response == null) {
                        return const Text("Error");
                      }
                      return SizedBox(
                        height: 300,
                        child: GridView.builder(
                            itemCount: response.docs.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisExtent: 300,
                              crossAxisSpacing: 10,
                              childAspectRatio: 2,
                            ),
                            itemBuilder: (context, index) {
                              final model = DressModel.fromMap(response.docs[index].data());

                              return Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(height: 150, fit: BoxFit.contain, model.imageUrl),
                                    Text(
                                      model.description,
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(model.type.toString()),
                                  ],
                                ),
                              );
                            }),
                      );
                    } else {
                      return const Text("Error");
                    }
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
                    style: TextStyle(color: AppColors.blackColor, fontSize: 20, letterSpacing: 4, fontWeight: FontWeight.bold, fontFamily: 'Bodoni')),
                Image.asset(Imageurll.divider),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 300,
                  child: FutureBuilder(
                      future: FirebaseFirestore.instance.collection("dreeses").limit(3).get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasData) {
                          final response = snapshot.data;
                          final dressesFirebase = response?.docs;
                          if (dressesFirebase?.isEmpty ?? true) {
                            return const Center(
                              child: Text("Liste Boş"),
                            );
                          }
                          return PageViewThreePage(dreses: dressesFirebase!);
                        } else {
                          return const Center(
                            child: Text("Hata çıktı"),
                          );
                        }
                      }),
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
                const SizedBox(height: 20),
                const Text("@ TRENDİNG",
                    style: TextStyle(color: AppColors.blackColor, fontSize: 20, letterSpacing: 4, fontWeight: FontWeight.bold, fontFamily: 'Bodoni')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Buton.homeButton(buttonText: "#2021", onPressed: () {}),
                    Buton.homeButton(buttonText: "#spring", onPressed: () {}),
                    Buton.homeButton(buttonText: "#collection", onPressed: () {}),
                    Buton.homeButton(buttonText: "#fall", onPressed: () {}),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Buton.homeButton(buttonText: "#dress", onPressed: () {}),
                    Buton.homeButton(buttonText: "#autumncollection", onPressed: () {}),
                    Buton.homeButton(buttonText: "#openfashion", onPressed: () {}),
                  ],
                ),
                const Text("Open",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20.0,
                      fontFamily: "Playfair",
                    )),
                const Text("Fashion", style: TextStyle(color: AppColors.blackColor, fontSize: 20.0, fontFamily: "Playfair")),
                const Align(
                  heightFactor: 2,
                  alignment: Alignment.center,
                  child: Text(
                    "Making a luxurious lifestyle accessible for a generous group of women is our daily drive.",
                    textAlign: TextAlign.center, // Metni yatayda ortalamak için TextAlign.center kullanın
                  ),
                ),
                const Image(image: AssetImage(Imageurll.divider)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomExpandedColumn(imagePath: ImageConstants.stickerone.toPng, text: "Free shipping on orders over \$25."),
                    CustomExpandedColumn(imagePath: ImageConstants.stickertwo.toPng, text: "Free returns on all orders."),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomExpandedColumn(imagePath: ImageConstants.stickerthree.toPng, text: "Unique designs and high-quality materials."),
                    CustomExpandedColumn(imagePath: ImageConstants.stickerfour.toPng, text: "Fast shipping. Free on orders over \$25."),
                  ],
                ),
                Align(heightFactor: 3, child: Image.asset(ImageConstants.stickerfive.toPng)),
                const Text("FOLLOW US",
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 20,
                    )),
                IconButton(onPressed: () {}, icon: Image.asset(Imageurll.instagram)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset(ImageConstants.groupone.toPng)),
                    Expanded(child: Image.asset(ImageConstants.grouptwo.toPng)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Image.asset(ImageConstants.groupthree.toPng)),
                    Expanded(child: Image.asset(ImageConstants.groupfour.toPng)),
                  ],
                ),
                const Iletisim(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageViewThreePage extends StatefulWidget {
  const PageViewThreePage({
    Key? key,
    required this.dreses,
  }) : super(key: key);
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> dreses;

  @override
  State<PageViewThreePage> createState() => _PageViewThreePageState();
}

class _PageViewThreePageState extends State<PageViewThreePage> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.horizontal,
      padEnds: false,
      itemCount: 3,
      onPageChanged: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        final Map<String, dynamic> dress = widget.dreses[index].data();

        return Column(
          children: [
            Expanded(child: Image.network(dress["imageUrl"], fit: BoxFit.cover)),
            Text(
              dress["description"],
              textAlign: TextAlign.center,
            ),
            Text(
              dress["price"].toString() ?? "10\$",
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
