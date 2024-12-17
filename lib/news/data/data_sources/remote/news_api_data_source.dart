import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/news/data/data_sources/remote/news_remote_data_source.dart';

import '../../../../shared/api_constants.dart';
import '../../../../shared/models/news_response.dart';

class NewsApiDataSource extends NewsRemoteDataSource {
  @override
  Future<NewsResponse> getNewsBySourceId({
    String? query,
    required String sourceId,
    required int pageSize,
    required int page,
  }) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
      'q': query,
    });
    final response = await http.get(uri);
    final responseBody = response.body;
    final json = jsonDecode(responseBody);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' || newsResponse.news != null) {
      return newsResponse;
    } else {
      throw Exception('Failed to get news');
    }
  }
}
