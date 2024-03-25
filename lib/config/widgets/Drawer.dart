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
                  child: Text(
                    "Women", // Kadınlar
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Man", // Erkekler
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: Text(
                    "Kids", // Çocuklar
                    textAlign: TextAlign.center,
                  ),
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
          const ExpansionTile(title: Text("New"), children: [
            ListTile(
              title: Text("T-Shirt"),
            ),
            ListTile(
              title: Text("Pantolon"),
            ),
            ListTile(
              title: Text("Elbise"),
            ),
            ListTile(
              title: Text("Etek"),
            ),
            ListTile(
              title: Text("Gömlek"),
            ),
          ]),
          const ExpansionTile(title: Text("Apperal"), children: [
            ListTile(
              title: Text("T-Shirt"),
            ),
            ListTile(
              title: Text("Pantolon"),
            ),
            ListTile(
              title: Text("Elbise"),
            ),
            ListTile(
              title: Text("Etek"),
            ),
            ListTile(
              title: Text("Gömlek"),
            ),
          ]),
          const ExpansionTile(title: Text("Bag"), children: [
            ListTile(
              title: Text("T-Shirt"),
            ),
          ]),
          const ExpansionTile(title: Text("Shoes"), children: [
            ListTile(
              title: Text("T-Shirt"),
            ),
          ]),
          const ExpansionTile(title: Text("Beauty"), children: [
            ListTile(
              title: Text("T-Shirt"),
            ),
          ]),
          const ExpansionTile(title: Text("Accessories"), children: [
            ListTile(
              title: Text("T-Shirt"),
            ),
          ]),
          ListTile(
            title: const Text("(786) 713-8616"),
            leading: Image.asset(Imageurll.call),
          ),
          ListTile(
            title: const Text("Accessories"),
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
