import 'package:flutter/material.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/news/news_item_details.dart';
import 'package:news_app/widgets/error_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});

  final String sourceId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNewsBySourceId(sourceId: sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.news ?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, NewsItemDetails.routeName,
                    arguments: newsList[index]);
              },
              child: NewsItem(
                news: newsList[index],
              ),
            ),
          );
        }
      },
    );
  }
}
