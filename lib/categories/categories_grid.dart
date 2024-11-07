import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/models/category_model.dart';

import '../utils/app_theme.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({
    super.key,
    required this.onCategorySelected,
  });

  final void Function(CategoryModel category) onCategorySelected;

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
                AppLocalizations.of(context)!.pick_your_category_of_interest,
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
                itemBuilder: (_, index) {
                  CategoryModel category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      onCategorySelected(category);
                    },
                    child: CategoryItem(
                      category: category,
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
