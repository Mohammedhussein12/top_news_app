import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/news_details/view/screens/news_item_details_screen.dart';
import 'package:news_app/settings/view_model/settings_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/shared/cache/cache_helper.dart';
import 'package:provider/provider.dart';

import 'home/view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheData.cacheInitialization();
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingsViewModel(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = Provider.of<SettingsViewModel>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsViewModel.language),
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
