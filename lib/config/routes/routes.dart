import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/features/category/category_page.dart';
import 'package:fashion_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());
      case AppRouteNames.homepage:
        return _materialRoute(const HomePage());
      case AppRouteNames.categorypage:
        return _materialRoute(const CategoryPage());

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
