import '../../../search/data/models/news_response.dart';

abstract class NewsDataSource {
  Future<List<News>> getNewsBySourceId({
    required String sourceId,
    required int page,
    required int pageSize});
}
