import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_app/news_details/view/screens/news_item_details_screen.dart';
import 'package:news_app/settings/view_model/settings_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/shared/cache/cache_helper.dart';
import 'package:news_app/shared/models/news_response.dart';
import 'package:news_app/sources/data/models/source_response.dart';
import 'package:path_provider/path_provider.dart';

import 'home/view/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(SourceResponseAdapter());
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(NewsResponseAdapter());
  Hive.registerAdapter(NewsAdapter());
  Hive.registerAdapter(NewsSourceAdapter());
  await CacheData.cacheInitialization();
  runApp(
    BlocProvider(
      create: (context) => SettingsViewModel(),
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = context.watch<SettingsViewModel>();
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
