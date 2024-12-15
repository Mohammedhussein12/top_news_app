import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/sources/data/data_sources/local/sources_local_data_source.dart';
import 'package:news_app/sources/data/data_sources/remote/sources_data_source.dart';

import '../data/models/source_response.dart';

class SourcesRepository {
  final SourcesRemoteDataSource remoteDataSource;
  final SourcesLocalDataSource localDataSource;

  SourcesRepository(this.remoteDataSource, this.localDataSource);

  Future<SourceResponse> getSourcesByCategoryId({
    required String categoryId,
  }) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    SourceResponse sourceResponse;
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      sourceResponse =
          await remoteDataSource.getSourcesByCategoryId(categoryId: categoryId);
      localDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      return await localDataSource.getSourcesByCategoryId(
          categoryId: categoryId);
    }
  }
}
