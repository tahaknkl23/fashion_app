import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.homeColor,
      elevation: 0.0,
      title: Align(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("Open",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 20.0,
                  fontFamily: "Tenor",
                )),
            Text("Fashion", style: TextStyle(color: AppColors.blackColor, fontSize: 20.0, fontFamily: "Playfair")),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(Imageurll.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(Imageurll.shopping),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
