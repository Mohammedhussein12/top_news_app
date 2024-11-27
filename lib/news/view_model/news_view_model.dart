import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../search/data/models/news_response.dart';
import '../../shared/service_locator.dart';
import '../repositories/news_repository.dart';

class NewsViewModel with ChangeNotifier {
  late final NewsRepository repository;
  static const pageSize = 10;
  List<News> news = [];

  final PagingController<int, News> pagingController =
      PagingController(firstPageKey: 1);

  NewsViewModel(String? sourceId) {
    repository = NewsRepository(ServiceLocator.newsDataSource);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, sourceId!);
    });
  }

  void _fetchPage(int pageKey, String sourceId) async {
    try {
      news = await repository.getNewsBySourceId(
        pageSize: pageSize,
        sourceId: sourceId,
        page: pageKey,
      );

      final isLastPage = (news.length) < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(news);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(news, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }
}