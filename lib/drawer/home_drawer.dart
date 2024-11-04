import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
    required this.onDrawerItemSelected,
  });

  final void Function(DrawerItem) onDrawerItemSelected;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final headlineSmallTextTheme = Theme.of(context).textTheme.headlineSmall;
    return SizedBox(
      width: screenWidth * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            color: AppTheme.primaryColor,
            height: screenHeight * 0.25,
            child: Text(
              AppLocalizations.of(context)!.news_app,
              style: headlineSmallTextTheme?.copyWith(color: AppTheme.white),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(start: 12, top: 12),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      onDrawerItemSelected(DrawerItem.categories);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          FontAwesomeIcons.list,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.categories,
                          style: headlineSmallTextTheme,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      onDrawerItemSelected(DrawerItem.settings);
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.settings,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
                          style: headlineSmallTextTheme,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem { settings, categories }
