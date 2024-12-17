import '../../../../shared/models/news_response.dart';

abstract class NewsLocalDataSource {
  Future<NewsResponse> getNews({required String sourceId});

  Future<void> saveNews(
      {required String sourceId, required NewsResponse newsResponse});
}
