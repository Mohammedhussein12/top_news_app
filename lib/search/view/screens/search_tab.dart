import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/search/view_model/search_states.dart';

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
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/home.png'),
        ),
      ),
      child: buildSearchData(context),
    );
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
      child: buildSearchData(context),
    );
  }

  Widget buildSearchData(BuildContext context) {
    return BlocProvider.value(
      value: searchViewModel
        ..searchByQuery(
          query: query,
          noNewsMessage: AppLocalizations.of(context)!.no_news_found,
          errorMessage: AppLocalizations.of(context)!.failed_to_get_news,
        ),
      child: BlocBuilder<SearchViewModel, SearchStates>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return const LoadingIndicator();
          } else if (state is SearchError) {
            return ErrorIndicator(state.errorMessage);
          } else if (state is SearchSuccess) {
            return ListView.builder(
              itemCount: state.newsResults.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    NewsItemDetails.routeName,
                    arguments: state.newsResults[index],
                  );
                },
                child: NewsItem(
                  news: state.newsResults[index],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
