import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';
import 'package:news_app/search/data/models/news_response.dart';

class NewsFirebaseDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNewsBySourceId({
    required String sourceId,
    required PagingController<int, News> pagingController,
    required int page,
  }) async {
    // firebase logic
    return [];
  }
}
