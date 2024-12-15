import '../../models/source_response.dart';

abstract class SourcesRemoteDataSource {
  Future<SourceResponse> getSourcesByCategoryId({required String categoryId});
}
