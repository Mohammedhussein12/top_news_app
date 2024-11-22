import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../shared/api_constants.dart';
import '../models/source_response.dart';

class SourcesDataSource {
  Future<SourceResponse> getSourcesByCategoryId(
      {required String categoryId}) async {
    final uri = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesEndPoint, {
      'apiKey': ApiConstants.apiKey,
      'category': categoryId,
    });
    final response = await http.get(uri);
    final responseBody = response.body;
    final json = jsonDecode(responseBody);
    return SourceResponse.fromJson(json);
  }
}
