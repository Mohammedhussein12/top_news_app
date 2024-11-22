import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/search/data/models/news_response.dart';
import 'package:provider/provider.dart';

import '../../../shared/app_theme.dart';
import '../../view_model/news_details_view_model.dart';

class NewsItemDetails extends StatelessWidget {
  static const String routeName = '/newsItemDetails';

  const NewsItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final titleSmallTextTheme = Theme.of(context).textTheme.titleSmall;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/home.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News Title'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.02,
              ),
              NewsItem(news: news),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 8.0, horizontal: 24),
                child: Text(
                  news.content ?? '',
                  style: titleSmallTextTheme?.copyWith(fontSize: 12),
                ),
              ),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                      vertical: 8.0, horizontal: 15),
                  child: ChangeNotifierProvider(
                    create: (context) => NewsDetailsViewModel(),
                    child: Consumer<NewsDetailsViewModel>(
                      builder: (_, newsDetailsViewModel, __) {
                        return TextButton(
                          style: const ButtonStyle(
                            overlayColor:
                                WidgetStatePropertyAll(Colors.transparent),
                          ),
                          onPressed: () {
                            newsDetailsViewModel.launchArticleUrl(
                                articleUrl: news.url ?? '');
                          },
                          child: Text(
                            AppLocalizations.of(context)!.view_full_article,
                            style: titleSmallTextTheme?.copyWith(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: AppTheme.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

