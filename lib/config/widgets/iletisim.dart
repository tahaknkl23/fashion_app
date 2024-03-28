import 'package:fashion_app/config/constants/image_url.dart';
import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/features/home/home_theme/button_theme.dart';
import 'package:flutter/material.dart';

class Iletisim extends StatefulWidget {
  const Iletisim({super.key});

  @override
  State<Iletisim> createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(Imageurll.twitter),
            Image.asset(Imageurll.instagram),
            Image.asset(Imageurll.youtube),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Image.asset(Imageurll.divider),
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(children: const [
            Text("support@openui.design", style: TextStyleOne.textStyle),
            Text("1-800-555-5555", style: TextStyleOne.textStyle),
            Text("Mon-Fri 9am-5pm", style: TextStyleOne.textStyle),
          ]),
        ),
        Image.asset(Imageurll.divider),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Buton.homeButton(buttonText: "ABOUT", onPressed: () {}),
            Buton.homeButton(buttonText: "CONTACT", onPressed: () {}),
            Buton.homeButton(
                buttonText: "BLOG",
                onPressed: () {
                  Navigator.pushNamed(context, AppRouteNames.blogpage);
                }),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Copyright© OpenUI All Rights Reserved.",
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
