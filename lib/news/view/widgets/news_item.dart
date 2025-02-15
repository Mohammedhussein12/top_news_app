import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/settings/view_model/settings_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

import '../../../shared/models/news_response.dart';
import '../../../shared/widgets/loading_indicator.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    final settingsViewModel =
        Provider.of<SettingsViewModel>(context, listen: false);
    timeago.setLocaleMessages('ar', ArMessages());

    final screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(vertical: 8.0, horizontal: 24),
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Hero(
                tag:
                    '${news.url ?? ''}-${news.publishedAt?.toIso8601String() ?? ''}',
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ??
                      'https://www.iisertvm.ac.in/assets/images/placeholder.jpg',
                  placeholder: (_, __) => const LoadingIndicator(),
                  errorWidget: (_, __, ___) =>
                      const Icon(Icons.image_not_supported_outlined),
                  height: screenHeight * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              )),
          const SizedBox(height: 4),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              news.source?.name ?? '',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: AppTheme.grey),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            news.title ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            news.description ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              textAlign: TextAlign.end,
              timeago.format(news.publishedAt!,
                  locale: settingsViewModel.language),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'inter',
                  color: AppTheme.grey),
            ),
          ),
        ],
      ),
    );
  }
}
