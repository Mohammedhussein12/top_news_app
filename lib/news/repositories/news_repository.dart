import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';

import '../../search/data/models/news_response.dart';

class NewsRepository {
  final NewsDataSource dataSource;

  NewsRepository(this.dataSource);

  Future<List<News>> getNewsBySourceId({
    required String sourceId,
    required PagingController<int, News> pagingController,
    required int page,
  }) {
    return dataSource.getNewsBySourceId(
      sourceId: sourceId,
      pagingController: pagingController,
      page: page,
    );
  }
}
