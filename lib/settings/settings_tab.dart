import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/settings/language.dart';
import 'package:news_app/settings/language_provider.dart';
import 'package:provider/provider.dart';

import '../utils/app_theme.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final headlineSmallTextTheme = Theme.of(context).textTheme.headlineSmall;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.of(context).size.width;
    List<Language> languages = [
      Language(name: AppLocalizations.of(context)!.english, code: 'en'),
      Language(name: AppLocalizations.of(context)!.arabic, code: 'ar'),
    ];

    return Padding(
      padding: const EdgeInsetsDirectional.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Text(
            AppLocalizations.of(context)!.language,
            style: headlineSmallTextTheme?.copyWith(fontSize: 14),
          ),
          DropdownButtonHideUnderline(
            child: Container(
              padding: EdgeInsetsDirectional.only(
                start: screenWidth * 0.03,
              ),
              margin: EdgeInsetsDirectional.only(
                top: screenHeight * 0.03,
              ),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.primaryColor),
              ),
              width: double.infinity,
              child: Consumer<LanguageProvider>(
                builder: (context, languageProvider, child) {
                  return DropdownButton<Language>(
                    iconEnabledColor: AppTheme.primaryColor,
                    iconDisabledColor: AppTheme.primaryColor,
                    value: languages.firstWhere(
                      (language) {
                        return languageProvider.language == language.code;
                      },
                    ),
                    items: languages.map((language) {
                      return DropdownMenuItem(
                        value: language,
                        child: Text(
                          language.name,
                          style: headlineSmallTextTheme?.copyWith(
                              fontSize: 14,
                              color: AppTheme.primaryColor,
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    }).toList(),
                    onChanged: (language) {
                      if (language == null) {
                        return;
                      }
                      languageProvider.changeLanguage(language.code);
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
