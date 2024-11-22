import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/categories/data/models/category_model.dart';
import 'package:news_app/categories/view/widgets/categories_grid.dart';
import 'package:news_app/home/view/widgets/home_drawer.dart';
import 'package:news_app/search/view/screens/search_tab.dart';
import 'package:news_app/settings/view/widgets/settings_tab.dart';

import '../../../categories/view/widgets/category_details.dart';
import '../../../shared/app_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedDrawerItem = DrawerItem.categories;
  CategoryModel? selectedCategory;

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
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchTab(),
                );
              },
            ),
          ],
          title: Text(selectedCategory != null
              ? selectedCategory!.name
              : selectedDrawerItem == DrawerItem.settings
                  ? AppLocalizations.of(context)!.settings
                  : AppLocalizations.of(context)!.news_app),
        ),
        body: selectedCategory != null
            ? CategoryDetails(categoryId: selectedCategory!.id)
            : selectedDrawerItem == DrawerItem.settings
                ? const SettingsTab()
                : CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  ),
        drawer: HomeDrawer(
          onDrawerItemSelected: onDrawerItemSelected,
        ),
      ),
    );
  }

  void onDrawerItemSelected(DrawerItem drawerItem) {
    selectedCategory = null;
    setState(() {
      selectedDrawerItem = drawerItem;
    });
  }

  void onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
