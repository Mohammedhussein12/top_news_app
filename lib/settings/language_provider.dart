import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{
  String language = 'en';

  void changeLanguage(String newLanguage) {
    language = newLanguage;
    notifyListeners();
  }
}
