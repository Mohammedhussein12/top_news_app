import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../search/data/models/news_response.dart';

abstract class NewsDataSource {
  Future<List<News>> getNewsBySourceId({
    required String sourceId,
    required PagingController<int, News> pagingController,
    required int page,
  });
}
