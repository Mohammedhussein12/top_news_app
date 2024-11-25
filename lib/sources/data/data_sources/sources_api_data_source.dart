import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/sources/data/data_sources/sources_data_source.dart';

import '../../../shared/api_constants.dart';
import '../models/source_response.dart';

class SourcesApiDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSourcesByCategoryId(
      {required String categoryId}) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final responseBody = response.body;
    final json = jsonDecode(responseBody);
    final sourcesResponse = SourceResponse.fromJson(json);
    if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
      return sourcesResponse.sources!;
    } else {
      throw Exception('Failed to get sources');
    }
  }
}
