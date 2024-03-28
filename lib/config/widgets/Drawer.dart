import 'package:fashion_app/config/constants/image_url.dart';
import 'package:flutter/material.dart';

class DraweWidget extends StatefulWidget {
  const DraweWidget({super.key});

  @override
  State<DraweWidget> createState() => _DraweWidgetState();
}

class _DraweWidgetState extends State<DraweWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Expanded(
                  child: Text("Women", // Kadınlar
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Tenor")),
                ),
                Expanded(
                  child: Text("Man", // Erkekler
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Tenor")),
                ),
                Expanded(
                  child: Text("Kids", // Çocuklar
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: "Tenor")),
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.black,
          ),
          const SizedBox(
            height: 20.0,
          ),
          const ExpansionTile(title: Text("New", style: TextStyle(fontFamily: "Tenor")), children: [
            ListTile(
              title: Text(
                "T-Shirt",
                style: TextStyle(fontFamily: "Tenor"),
              ),
            ),
            ListTile(
              title: Text("Pantolon", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Elbise", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Etek", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Gömlek", style: TextStyle(fontFamily: "Tenor")),
            ),
          ]),
          const ExpansionTile(title: Text("Apperal", style: TextStyle(fontFamily: "Tenor")), children: [
            ListTile(
              title: Text("T-Shirt", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Pantolon", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Elbise", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Etek", style: TextStyle(fontFamily: "Tenor")),
            ),
            ListTile(
              title: Text("Gömlek", style: TextStyle(fontFamily: "Tenor")),
            ),
          ]),
          const ExpansionTile(title: Text("Bag", style: TextStyle(fontFamily: "Tenor")), children: [
            ListTile(
              title: Text("T-Shirt", style: TextStyle(fontFamily: "Tenor")),
            ),
          ]),
          const ExpansionTile(title: Text("Shoes", style: TextStyle(fontFamily: "Tenor")), children: [
            ListTile(
              title: Text("T-Shirt", style: TextStyle(fontFamily: "Tenor")),
            ),
          ]),
          const ExpansionTile(title: Text("Beauty", style: TextStyle(fontFamily: "Tenor")), children: [
            ListTile(
              title: Text("T-Shirt",style: TextStyle(fontFamily: "Tenor")),
            ),
          ]),
          const ExpansionTile(title: Text("Accessories", style: TextStyle(fontFamily: "Tenor")), children: [
            ListTile(
              title: Text("T-Shirt",style: TextStyle(fontFamily: "Tenor")),
            ),
          ]),
          ListTile(
            title: const Text("(786) 713-8616", style: TextStyle(fontFamily: "Tenor")),
            leading: Image.asset(Imageurll.call),
          ),
          ListTile(
            title: const Text("Accessories", style: TextStyle(fontFamily: "Tenor")),
            leading: Image.asset(Imageurll.location),
          ),
          Image.asset(Imageurll.divider),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(Imageurll.twitter),
              Image.asset(Imageurll.instagram),
              Image.asset(Imageurll.youtube),
            ],
          ),
        ],
      ),
    );
  }
}
