import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/tabs/sources_tabs.dart';

import '../widgets/error_indicator.dart';
import '../widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key, required this.categoryId});

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSourcesByCategoryId(categoryId: categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final sources = snapshot.data?.sources ?? [];
          return SourcesTabs(sources: sources);
        }
      },
    );
  }
}
