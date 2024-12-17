import '../../shared/models/news_response.dart';

abstract class SearchStates {}

class SearchInitial extends SearchStates {}

class SearchLoading extends SearchStates {}

class SearchSuccess extends SearchStates {
  final List<News> newsResults;

  SearchSuccess({required this.newsResults});
}

class SearchError extends SearchStates {
  final String errorMessage;

  SearchError({required this.errorMessage});
}
