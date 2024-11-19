import 'package:flutter/material.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/news/article_url_launcher.dart';
import 'package:news_app/news/news_item.dart';

import '../utils/app_theme.dart';

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
        body: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            NewsItem(news: news),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 8.0, horizontal: 24),
              child: Text(
                news.description ?? '',
                style: titleSmallTextTheme?.copyWith(fontSize: 12),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 8.0, horizontal: 15),
                child: TextButton(
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {
                    UrlLauncher.launchArticleUrl(articleUrl: news.url ?? '');
                  },
                  child: Text(
                    'View Full Article >>',
                    style: titleSmallTextTheme?.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: AppTheme.grey,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
