import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../news/view/widgets/news_item.dart';
import '../../../news_details/view/screens/news_item_details_screen.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/widgets/error_indicator.dart';
import '../../../shared/widgets/loading_indicator.dart';
import '../../view_model/search_view_model.dart';

class SearchTab extends SearchDelegate {
  final searchViewModel = SearchViewModel();

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        shape: Theme.of(context).appBarTheme.shape,
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
      ),
      textTheme: Theme.of(context).textTheme,
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintStyle: TextStyle(color: AppTheme.white),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppTheme.white,
      ),
    );
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
    color: AppTheme.white,
    fontSize: 22,
  );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          searchViewModel.clearSearchResults();
        },
        icon: const Icon(
          Icons.clear,
          size: 28,
          color: Colors.white,
        ),
      ),
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(
          Icons.search,
          size: 30,
          color: Colors.white,
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
        color: Colors.white,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSearchData();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/home.png'),
          ),
        ),
        child: Center(
          child:
          Text(AppLocalizations.of(context)!.please_enter_text_to_search),
        ),
      );
    }

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/home.png'),
        ),
      ),
      child: buildSearchData(),
    );
  }

  Widget buildSearchData() {
    return ChangeNotifierProvider.value(
      value: searchViewModel..searchByQuery(query: query),
      child: Consumer<SearchViewModel>(
        builder: (context, searchViewModel, child) {
          if (searchViewModel.isLoading) {
            return const LoadingIndicator();
          } else if (searchViewModel.errorMessage != null &&
              searchViewModel.errorMessage!.isNotEmpty) {
            return ErrorIndicator(searchViewModel.errorMessage!);
          } else if (searchViewModel.news.isEmpty) {
            return const Center(
              child: Text('No news found'),
            );
          } else {
            return ListView.builder(
              itemCount: searchViewModel.news.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NewsItemDetails.routeName,
                    arguments: searchViewModel.news[index],
                  );
                },
                child: NewsItem(
                  news: searchViewModel.news[index],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
