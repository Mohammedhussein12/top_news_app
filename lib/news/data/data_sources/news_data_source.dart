import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../search/data/models/news_response.dart';
import '../../../shared/api_constants.dart';

class NewsDataSource {
  Future<NewsResponse> getNewsBySourceId({
    String? query,
    String? sourceId,
    int? pageSize,
    int? page,
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
    return NewsResponse.fromJson(json);
  }
}
