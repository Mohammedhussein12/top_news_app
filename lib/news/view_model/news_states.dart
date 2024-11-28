import '../../search/data/models/news_response.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class GetNewsLoadingState extends NewsStates {}

class GetNewsSuccessState extends NewsStates {
  final List<News> news;

  GetNewsSuccessState({required this.news});
}

class GetNewsErrorState extends NewsStates {
  final String errorMessage;

  GetNewsErrorState({required this.errorMessage});
}
