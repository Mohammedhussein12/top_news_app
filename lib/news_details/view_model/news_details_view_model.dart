import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news_details/view_model/news_details_states.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsViewModel extends Cubit<NewsDetailsState> {
  NewsDetailsViewModel() : super(NewsDetailsInitial());

  Future<void> launchArticleUrl({required String articleUrl}) async {
    emit(LaunchArticleUrlLoadingState());
    final Uri url = Uri.parse(articleUrl);
    emit(LaunchArticleUrlSuccessState());
    if (!await launchUrl(url)) {
      emit(LaunchArticleUrlErrorState(errorMessage: 'Could not launch $url'));
    }
  }
}
