import 'package:hive/hive.dart';
import 'package:news_app/news/data/data_sources/local/news_local_data_source.dart';

import '../../../../shared/models/news_response.dart';

class NewsHiveLocalDataSource extends NewsLocalDataSource {
  static const String _boxName = 'news';

  @override
  Future<NewsResponse> getNews({required String sourceId}) async {
    try {
      final box = await Hive.openBox<NewsResponse>(_boxName);
      final cachedNews = box.get(sourceId);
      if (cachedNews == null) {
        throw Exception('No Cached News for this source');
      }
      await box.close();
      return cachedNews;
    } catch (e) {
      throw Exception('Failed to Get Cached News');
    }
  }

  @override
  Future<void> saveNews(
      {required String sourceId, required NewsResponse newsResponse}) async {
    try {
      final box = await Hive.openBox<NewsResponse>(_boxName);
      await box.put(sourceId, newsResponse);
      await box.close();
    } catch (e) {
      throw Exception('Failed to save News');
    }
  }
}
