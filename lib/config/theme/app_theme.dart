import 'package:fashion_app/config/items/app_colors.dart';
import 'package:fashion_app/config/items/linear_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.homeColor,
  );

  static final ThemeData darkTheme = ThemeData(primarySwatch: Colors.blue, useMaterial3: true, scaffoldBackgroundColor: AppColors.errorColor);

  static const TextStyle weatherTextStyle = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
  );

  static const BoxDecoration relaxColorTwoDecoration = BoxDecoration(
    gradient: LinearColors.relaxColortwo,
  );
  static const BoxDecoration relaxColorDecoration = BoxDecoration(
    gradient: LinearColors.relaxcolor,
  );
  static const TextStyle weatherTextStyle24 = TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    color: AppColors.accentColor,
  );
}
