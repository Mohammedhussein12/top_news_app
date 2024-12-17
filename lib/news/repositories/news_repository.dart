import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/news/data/data_sources/local/news_local_data_source.dart';
import 'package:news_app/news/data/data_sources/remote/news_remote_data_source.dart';

import '../../shared/models/news_response.dart';

class NewsRepository {
  late final NewsRemoteDataSource newsRemoteDataSource;
  late final NewsLocalDataSource newsLocalDataSource;

  NewsRepository(this.newsRemoteDataSource, this.newsLocalDataSource);

  Future<NewsResponse> getNewsBySourceId({
    required String sourceId,
    required int pageSize,
    required int page,
  }) async {
    try {
      final connectivityResult = await Connectivity().checkConnectivity();
      NewsResponse newsResponse;
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        newsResponse = await newsRemoteDataSource.getNewsBySourceId(
            sourceId: sourceId, page: page, pageSize: pageSize);
        await newsLocalDataSource.saveNews(
            sourceId: sourceId, newsResponse: newsResponse);
        return newsResponse;
      } else {
        return newsLocalDataSource.getNews(sourceId: sourceId);
      }
    } catch (e) {
      throw Exception('Failed to get News');
    }
  }
}
