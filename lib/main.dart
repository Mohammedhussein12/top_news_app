import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/news/news_item_details.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/settings/language_provider.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

import 'cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.language),
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        NewsItemDetails.routeName: (context) => const NewsItemDetails(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
