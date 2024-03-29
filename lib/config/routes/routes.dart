import 'package:fashion_app/config/routes/app_route_names.dart';
import 'package:fashion_app/features/Category/category_page.dart';
import 'package:fashion_app/features/Detail/detail_page.dart';
import 'package:fashion_app/features/home/home_page.dart';
import 'package:fashion_app/features/post/blog_post_age.dart';
import 'package:flutter/material.dart';

import '../../features/Blog/blog_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomePage());

      case AppRouteNames.homepage:
        return _materialRoute(const HomePage());

      case AppRouteNames.categorypage:
        return _materialRoute(const CategoryPage());

      case AppRouteNames.blogpage:
        return _materialRoute(const BlogPage());

      case AppRouteNames.postpage:
        return _materialRoute(const BlogPostPage());

      case AppRouteNames.detailpage:
        return _materialRoute(const DetailPage());

      default:
        return _materialRoute(const HomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
