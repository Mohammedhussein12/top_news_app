import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/settings/view_model/settings_states.dart';

import '../../shared/cache/cache_helper.dart';

class SettingsViewModel extends Cubit<SettingsStates> {
  String language = 'en';

  SettingsViewModel() : super(SettingsInitial()) {
    getLanguage();
  }

  void changeLanguage(String newLanguage) {
    language = newLanguage;
    setLanguage(language);
    emit(LanguageChanged(language: language));
  }

  void setLanguage(String newLanguage) {
    if (newLanguage == 'en') {
      CacheData.setData(key: 'language', value: 'en');
    } else if (newLanguage == 'ar') {
      CacheData.setData(key: 'language', value: 'ar');
    }
  }

  void getLanguage() {
    String? selectedLanguage = CacheData.getData(key: 'language') ?? 'en';
    if (selectedLanguage != null) {
      language = selectedLanguage;
    }
  }
}