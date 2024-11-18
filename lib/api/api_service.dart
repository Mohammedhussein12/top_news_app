import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/source_response.dart';

import '../models/news_response.dart';

class ApiService {
  static Future<SourceResponse> getSourcesByCategoryId(
      {required String categoryId}) async {
    try {
      final uri =
          Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint, {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      });
      final response = await http.get(uri);
      final responseBody = response.body;
      final json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (error) {
      throw Exception('$error');
    }
  }

  static Future<NewsResponse> getNewsBySourceId(
      {required String sourceId}) async {
    try {
      final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.newsEndPoint, {
        'apiKey': ApiConstants.apiKey,
        'sources': sourceId,
      });
      final response = await http.get(uri);
      final responseBody = response.body;
      final json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (error) {
      throw Exception('$error');
    }
  }
}
