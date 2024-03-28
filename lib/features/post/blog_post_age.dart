import 'package:fashion_app/config/widgets/Appbar.dart';
import 'package:fashion_app/config/widgets/Drawer.dart';
import 'package:flutter/material.dart';

class BlogPostPage extends StatefulWidget {
  const BlogPostPage({super.key});

  @override
  State<BlogPostPage> createState() => _BlogPostPageState();
}

class _BlogPostPageState extends State<BlogPostPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppbarWidget(),
      drawer: Drawer(
        child: DraweWidget(),
      ),
      body: SingleChildScrollView(),
    );
  }
}
