import 'package:news_app/news/data/data_sources/news_api_data_source.dart';
import 'package:news_app/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_sources/sources_data_source.dart';

import '../news/data/data_sources/news_data_sources.dart';

class ServiceLocator {
  static final SourcesDataSource sourcesApiDataSource = SourcesApiDataSource();
  static final NewsDataSource newsApiDataSource = NewsApiDataSource();
}
