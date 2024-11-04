import 'package:flutter/material.dart';
import 'package:news_app/categories/categories_grid.dart';

import '../utils/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/home.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: const CategoriesGrid(),
      ),
    );
  }
}
