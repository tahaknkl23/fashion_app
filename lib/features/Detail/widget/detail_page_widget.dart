import 'package:flutter/material.dart';

class containerTextstyle {
  static const TextStyle textstyle = TextStyle(
    fontFamily: "Teros",
    fontSize: 22,
  );
}

class BuildColorButton {
  static Widget buildColorButton(Color color) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class BuildSizeButton {
  static Widget buildSizeButton(String size) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        shape: BoxShape.circle,
      ),
      child: Text(
        size,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
