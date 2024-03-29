import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/config/utility/enums/image_constants.dart';
import 'package:fashion_app/config/widgets/appbar.dart';
import 'package:fashion_app/config/widgets/drawer.dart';
import 'package:fashion_app/config/widgets/iletisim.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages = 5; // Toplam sayfa sayısı
  int _currentMax = 6; // İlk yükleme miktarı
  final int _increment = 6; // Her yüklemede artırılacak miktar

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      _currentPage = _pageController.page!.round();
    });
  }

  void _loadMoreData(int pageNumber) {
    setState(() {
      _currentMax = (pageNumber + 1) * _increment;
    });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "4500 APPERAL",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Tenor",
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {},
                  label: const Text(
                    "NEW",
                    style: TextStyle(fontFamily: "Tenor"),
                  ),
                  icon: const Icon(Icons.arrow_drop_down),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list_sharp)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: _currentMax,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            AppRouteNames.detailpage;
                          },
                          child: Image.asset(ImageConstants.productOne.toPng, fit: BoxFit.cover)),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  _totalPages,
                  (index) {
                    if (index == _totalPages - 1) {
                      return Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _currentPage = index;
                                _currentMax = (index + 1) * _increment;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _currentPage == index ? Colors.black : Colors.grey.withOpacity(0.5),
                            ),
                            child: Text(
                              (index + 1).toString(),
                              style: TextStyle(color: _currentPage == index ? Colors.white : Colors.black),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (_currentPage < _totalPages - 1) {
                                setState(() {
                                  _currentPage++;
                                  _currentMax = (_currentPage + 1) * _increment;
                                });
                              }
                            },
                            icon: const Icon(Icons.arrow_forward),
                            color: _currentPage < _totalPages - 1 ? Colors.black : Colors.grey.withOpacity(0.5),
                          ),
                        ],
                      );
                    } else {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _currentPage = index;
                              _currentMax = (index + 1) * _increment;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _currentPage == index ? Colors.black : Colors.grey.withOpacity(0.5),
                          ),
                          child: Text(
                            (index + 1).toString(),
                            style: TextStyle(color: _currentPage == index ? Colors.white : Colors.black),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
            const Iletisim(),
          ],
        ),
      ),
    );
  }
}
