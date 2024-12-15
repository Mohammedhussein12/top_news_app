import '../../models/source_response.dart';

abstract class SourcesLocalDataSource {
  Future<SourceResponse> getSourcesByCategoryId({required String categoryId});

  Future<void> saveSources(SourceResponse sourceResponse, String categoryId);
}
