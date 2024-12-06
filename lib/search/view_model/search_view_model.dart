import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/search/data/data_sources/search_data_source.dart';
import 'package:news_app/search/view_model/search_states.dart';

class SearchViewModel extends Cubit<SearchStates> {
  SearchViewModel() : super(SearchInitial());
  final dataSource = SearchDataSource();

  void searchByQuery({
    required String query,
    required String noNewsMessage,
    required String errorMessage,
  }) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());
    try {
      final searchResponse = await dataSource.getNewsBySourceId(query: query);
      if (searchResponse.status == 'ok' && searchResponse.news != null) {
        final newsResults = searchResponse.news!;
        emit(SearchSuccess(newsResults: newsResults));
      } else if (searchResponse.news == null) {
        emit(SearchError(errorMessage: noNewsMessage));
      }
    } catch (error) {
      emit(SearchError(errorMessage: error.toString()));
    }
  }
}
