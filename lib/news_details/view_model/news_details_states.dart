abstract class NewsDetailsState {}

class NewsDetailsInitial extends NewsDetailsState {}

class LaunchArticleUrlLoadingState extends NewsDetailsState {}

class LaunchArticleUrlSuccessState extends NewsDetailsState {}

class LaunchArticleUrlErrorState extends NewsDetailsState {
  final String errorMessage;

  LaunchArticleUrlErrorState({required this.errorMessage});
}
