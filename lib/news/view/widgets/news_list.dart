import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

import '../../../news_details/view/screens/news_item_details_screen.dart';
import '../../../search/data/models/news_response.dart';
import '../../../shared/widgets/loading_indicator.dart';
import 'news_item.dart';

class NewsList extends StatefulWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsViewModel(widget.sourceId),
      child: Consumer<NewsViewModel>(
        builder: (context, newsViewModel, _) {
          return PagedListView<int, News>(
            pagingController: newsViewModel.pagingController,
            builderDelegate: PagedChildBuilderDelegate<News>(
              itemBuilder: (context, news, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, NewsItemDetails.routeName,
                      arguments: news);
                },
                child: NewsItem(news: news),
              ),
              noItemsFoundIndicatorBuilder: (context) => const Center(
                child: Text('No news found'),
              ),
              firstPageProgressIndicatorBuilder: (context) =>
              const LoadingIndicator(),
              newPageProgressIndicatorBuilder: (context) =>
              const LoadingIndicator(),
              noMoreItemsIndicatorBuilder: (context) => const Center(
                child: Text('No more news'),
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
