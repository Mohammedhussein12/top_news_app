import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../news_details/view/screens/news_item_details_screen.dart';
import '../../../search/data/models/news_response.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../view_model/news_states.dart';
import '../../view_model/news_view_model.dart';
import 'news_item.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewsViewModel(sourceId),
      child: BlocBuilder<NewsViewModel, NewsStates>(
        builder: (context, state) {
          final cubit = context.read<NewsViewModel>();
          return PagedListView<int, News>(
            pagingController: cubit.pagingController,
            builderDelegate: PagedChildBuilderDelegate<News>(
              itemBuilder: (context, news, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NewsItemDetails.routeName,
                      arguments: news);
                },
                child: NewsItem(news: news),
              ),
              noItemsFoundIndicatorBuilder: (context) => Center(
                child: Text(AppLocalizations.of(context)!.no_news_found),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
                  const LoadingIndicator(),
              newPageProgressIndicatorBuilder: (context) =>
                  const LoadingIndicator(),
              noMoreItemsIndicatorBuilder: (context) => Center(
                child: Text(AppLocalizations.of(context)!.no_more_news),
              ),
              transitionDuration: const Duration(seconds: 2),
              animateTransitions: true,
            ),
          );
        },
      ),
    );
  }
}
