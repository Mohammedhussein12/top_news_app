import 'package:flutter/material.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/models/category_model.dart';

import '../utils/app_theme.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    List<CategoryModel> categories = List.generate(
      6,
      (index) => CategoryModel(
          id: '$index', name: 'Sports', color: AppTheme.red, imageName: 'ball'),
    );
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
              child: Text(
                'Pick your category of interest',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: screenWidth * 0.07,
                    mainAxisSpacing: screenHeight * 0.034,
                    crossAxisCount: 2),
                itemBuilder: (_, index) => CategoryItem(
                  category: categories[index],
                  index: index,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
