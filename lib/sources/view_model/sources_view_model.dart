import 'package:flutter/material.dart';
import 'package:news_app/sources/data/models/source_response.dart';

import '../data/data_sources/sources_data_source.dart';

class SourcesViewModel with ChangeNotifier {
  final dataSource = SourcesDataSource();
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;

  Future<void> getSourcesByCategoryId({required String categoryId}) async {
    isLoading = true;
    notifyListeners();
    try {
      final response =
          await dataSource.getSourcesByCategoryId(categoryId: categoryId);
      if (response.status == 'ok' && response.sources != null) {
        sources = response.sources!;
      } else {
        errorMessage = "Failed To Get Sources";
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
