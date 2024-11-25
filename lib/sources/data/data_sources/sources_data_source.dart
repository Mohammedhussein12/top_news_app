import '../models/source_response.dart';

abstract class SourcesDataSource {
  Future<List<Source>> getSourcesByCategoryId({required String categoryId});
}
