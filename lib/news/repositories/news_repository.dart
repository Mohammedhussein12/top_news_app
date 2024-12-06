import 'package:news_app/news/data/data_sources/news_data_sources.dart';

import '../../search/data/models/news_response.dart';

class NewsRepository {
  late final NewsDataSource dataSource;

  NewsRepository(this.dataSource);

  Future<List<News>> getNewsBySourceId({
    required String sourceId,
    required int pageSize,
    required int page,
  }) async {
    return dataSource.getNewsBySourceId(
        sourceId: sourceId, page: page, pageSize: pageSize);
  }
}
