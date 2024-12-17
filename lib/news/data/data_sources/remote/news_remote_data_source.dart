import '../../../../shared/models/news_response.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(
      {required String sourceId, required int page, required int pageSize});
}
