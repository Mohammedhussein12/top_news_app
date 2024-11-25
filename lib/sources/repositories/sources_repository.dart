import 'package:news_app/sources/data/data_sources/sources_data_source.dart';

import '../data/models/source_response.dart';

class SourcesRepository {
  final SourcesDataSource dataSource;

  SourcesRepository(this.dataSource);

  Future<List<Source>> getSourcesByCategoryId({
    required String categoryId,
  }) async {
    return dataSource.getSourcesByCategoryId(categoryId: categoryId);
  }
}
