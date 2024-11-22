import 'package:flutter/material.dart';
import 'package:news_app/search/data/data_sources/search_data_source.dart';

import '../../search/data/models/news_response.dart';

class SearchViewModel with ChangeNotifier {
  final dataSource = SearchDataSource();
  List<News> news = [];
  bool isLoading = false;
  String? errorMessage = '';

  void searchByQuery({required String query}) async {
    isLoading = true;
    notifyListeners();
    try {
      final searchResponse = await dataSource.getNewsBySourceId(query: query);
      if (searchResponse.status == 'ok' && searchResponse.news != null) {
        news = searchResponse.news!;
      } else {
        errorMessage = 'Failed To Get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
