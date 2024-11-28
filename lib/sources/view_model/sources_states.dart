import 'package:news_app/sources/data/models/source_response.dart';

abstract class SourcesState {}

class SourcesInitialState extends SourcesState {}

class GetSourcesLoadingState extends SourcesState {}

class GetSourcesSuccessState extends SourcesState {
  final List<Source> sources;

  GetSourcesSuccessState({required this.sources});
}

class GetSourcesErrorState extends SourcesState {
  final String errorMessage;

  GetSourcesErrorState({required this.errorMessage});
}
