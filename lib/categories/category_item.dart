import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category, required this.index});

  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    final titleMediumTextTheme = Theme.of(context).textTheme.titleMedium;
    return Container(
      padding: const EdgeInsetsDirectional.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.only(
          topStart: const Radius.circular(25),
          topEnd: const Radius.circular(25),
          bottomStart: Radius.circular(index.isEven ? 25 : 0),
          bottomEnd: Radius.circular(index.isOdd ? 25 : 0),
        ),
        color: category.color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            height: 90,
            width: 90,
            'assets/images/${category.imageName}.png',
            fit: BoxFit.cover,
          ),
          Text(
            category.name,
            style: titleMediumTextTheme?.copyWith(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
