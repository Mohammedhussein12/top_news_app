import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../shared/models/news_response.dart';
import '../../shared/service_locator.dart';
import '../repositories/news_repository.dart';
import 'news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  final NewsRepository repository;
  final PagingController<int, News> pagingController =
      PagingController(firstPageKey: 1);

  static const int pageSize = 10;

  NewsViewModel(String sourceId)
      : repository = NewsRepository(ServiceLocator.newsRemoteDataSource,
            ServiceLocator.newsLocalDataSource),
        super(NewsInitialState()) {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey, sourceId);
    });
  }

  void _fetchPage(int pageKey, String sourceId) async {
    try {
      final news = await repository.getNewsBySourceId(
        pageSize: pageSize,
        sourceId: sourceId,
        page: pageKey,
      );
      final isLastPage = news.news!.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(news.news!);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(news.news!, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
