import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/shared/service_locator.dart';

import '../../search/data/models/news_response.dart';
import '../repositories/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository repository;

  late final PagingController<int, News> pagingController =
      PagingController(firstPageKey: 1);
  List<News> news = [];
  String? errorMessage;

  NewsViewModel(String sourceId) {
    repository = NewsRepository(ServiceLocator.newsApiDataSource);
    pagingController.addPageRequestListener(
      (pageKey) async {
        try {
          news = await repository.getNewsBySourceId(
            sourceId: sourceId,
            pagingController: pagingController,
            page: pageKey,
          );
        } catch (error) {
          errorMessage = error.toString();
        }
      },
    );
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}
