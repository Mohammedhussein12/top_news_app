import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/news/data/data_sources/news_data_sources.dart';

import '../../../search/data/models/news_response.dart';
import '../../../shared/api_constants.dart';

class NewsApiDataSource extends NewsDataSource {
  @override
  Future<List<News>> getNewsBySourceId({
    required String sourceId,
    required PagingController<int, News> pagingController,
    required int page,
    int pageSize = 10,
  }) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    });

    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.news != null || newsResponse.status == 'ok') {
      final isLastPage = (newsResponse.news ?? []).length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newsResponse.news ?? []);
      } else {
        final nextPageKey = page + 1;
        pagingController.appendPage(newsResponse.news ?? [], nextPageKey);
      }
      return newsResponse.news!;
    } else {
      throw Exception('Failed to Get news');
    }
  }
}
