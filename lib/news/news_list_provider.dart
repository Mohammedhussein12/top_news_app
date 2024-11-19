import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/api/api_service.dart';

import '../models/news_response.dart';

class NewsProvider extends ChangeNotifier {
  static const _pageSize = 10;
  final PagingController<int, News> pagingController =
      PagingController(firstPageKey: 1);

  NewsProvider(String sourceId) {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, sourceId);
    });
  }

  void _fetchPage(int pageKey, String sourceId) async {
    try {
      final newsResponse = await ApiService.getNewsBySourceId(
        pageSize: _pageSize,
        sourceId: sourceId,
        page: pageKey,
      );

      final isLastPage = (newsResponse.news?.length ?? 0) < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newsResponse.news ?? []);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(newsResponse.news ?? [], nextPageKey);
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
