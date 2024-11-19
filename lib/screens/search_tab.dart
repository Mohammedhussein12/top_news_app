import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../api/api_service.dart';
import '../news/news_item.dart';
import '../news/news_item_details.dart';
import '../utils/app_theme.dart';
import '../widgets/error_indicator.dart';
import '../widgets/loading_indicator.dart';

class SearchTab extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
          size: 28,
          color: Colors.black,
        ),
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(
          Icons.search,
          size: 30,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: buildSearchData(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        color: Colors.white,
        child: Center(
          child:
              Text(AppLocalizations.of(context)!.please_enter_text_to_search),
        ),
      );
    }
    return Container(
      color: Colors.white,
      child: buildSearchData(),
    );
  }

  Widget buildSearchData() {
    return FutureBuilder(
      future: ApiService.getNewsBySourceId(query: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError) {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.news ?? [];
          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  NewsItemDetails.routeName,
                  arguments: newsList[index],
                );
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
