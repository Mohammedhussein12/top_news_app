import 'package:flutter/material.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Category Details'),
    );
  }
}
