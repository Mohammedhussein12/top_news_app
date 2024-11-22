import 'package:flutter/cupertino.dart';

import '../../shared/cache/cache_helper.dart';

class SettingsViewModel with ChangeNotifier {
  String language = 'en';

  SettingsViewModel() {
    getLanguage();
  }

  void changeLanguage(String newLanguage) {
    language = newLanguage;
    setLanguage(language);
    notifyListeners();
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
    notifyListeners();
  }
}
