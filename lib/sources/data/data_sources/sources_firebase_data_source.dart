import 'package:news_app/sources/data/data_sources/sources_data_source.dart';
import 'package:news_app/sources/data/models/source_response.dart';

class SourcesFirebaseDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSourcesByCategoryId(
      {required String categoryId}) async {
    // firebase Logic
    return [];
  }
}
