import 'package:hive/hive.dart';
import 'package:news_app/sources/data/data_sources/local/sources_local_data_source.dart';
import 'package:news_app/sources/data/models/source_response.dart';

class SourcesHiveLocalDataSource implements SourcesLocalDataSource {
  static const String _boxName = 'sources_box';

  @override
  Future<SourceResponse> getSourcesByCategoryId(
      {required String categoryId}) async {
    try {
      final box = await Hive.openBox<SourceResponse>(_boxName);
      final cachedSource = box.get(categoryId);
      if (cachedSource == null) {
        throw Exception('No cached sources found');
      }
      await box.close();
      return cachedSource;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> saveSources(
      SourceResponse sourceResponse, String categoryId) async {
    try {
      final box = await Hive.openBox<SourceResponse>(_boxName);
      await box.put(categoryId, sourceResponse);
      await box.close();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
