import 'package:flutter/material.dart';
import 'package:news_app/tabs/sources_tabs.dart';

import '../models/source.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key, required this.categoryId});

  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources =
      List.generate(10, (index) => Source(id: '$index', name: 'source $index'));

  @override
  Widget build(BuildContext context) {
    return SourcesTabs(
      sources: sources,
    );
  }
}
