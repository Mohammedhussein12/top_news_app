import 'package:news_app/news/data/data_sources/local/news_hive_local_data_source.dart';
import 'package:news_app/news/data/data_sources/local/news_local_data_source.dart';
import 'package:news_app/news/data/data_sources/remote/news_api_data_source.dart';
import 'package:news_app/sources/data/data_sources/local/sources_hive_local_data_source.dart';
import 'package:news_app/sources/data/data_sources/local/sources_local_data_source.dart';
import 'package:news_app/sources/data/data_sources/remote/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_sources/remote/sources_data_source.dart';

import '../news/data/data_sources/remote/news_remote_data_source.dart';

class ServiceLocator {
  static final SourcesRemoteDataSource sourcesRemoteDataSource =
      SourcesApiDataSource();
  static final SourcesLocalDataSource sourcesLocalDataSource =
      SourcesHiveLocalDataSource();
  static final NewsRemoteDataSource newsRemoteDataSource = NewsApiDataSource();
  static final NewsLocalDataSource newsLocalDataSource =
      NewsHiveLocalDataSource();
}
