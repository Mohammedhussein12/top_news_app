import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../search/data/models/news_response.dart';
import '../data/data_sources/news_data_source.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  static const _pageSize = 10;

  final PagingController<int, News> pagingController =
      PagingController(firstPageKey: 1);

  NewsViewModel(String? sourceId) {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, sourceId!);
    });
  }

  void _fetchPage(int pageKey, String sourceId) async {
    try {
      final newsResponse = await dataSource.getNewsBySourceId(
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
