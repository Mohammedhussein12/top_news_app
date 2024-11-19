import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

import '../models/news_response.dart';
import '../widgets/loading_indicator.dart';
import 'news_item.dart';
import 'news_item_details.dart';
import 'news_list_provider.dart';

class NewsList extends StatelessWidget {
  final String sourceId;

  const NewsList({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NewsProvider(sourceId),
      child: Consumer<NewsProvider>(
        builder: (context, newsProvider, _) {
          return PagedListView<int, News>(
            pagingController: newsProvider.pagingController,
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
