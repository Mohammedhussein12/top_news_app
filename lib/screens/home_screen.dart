import 'package:flutter/material.dart';
import 'package:news_app/categories/categories_grid.dart';
import 'package:news_app/drawer/home_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/settings/settings_tab.dart';
import '../utils/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.white,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/home.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.news_app),
        ),
        body: selectedDrawerItem == DrawerItem.settings
            ? const SettingsTab()
            : const CategoriesGrid(),
        drawer: HomeDrawer(
          onDrawerItemSelected: onDrawerItemSelected,
        ),
      ),
    );
  }

  onDrawerItemSelected(DrawerItem drawerItem) {
    setState(() {
      selectedDrawerItem = drawerItem;
    });
  }
}
