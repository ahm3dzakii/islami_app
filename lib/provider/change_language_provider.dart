import 'package:flutter/material.dart';

class ChangeLanguageProvider extends ChangeNotifier {

  String defLanguage = 'en';

  void changeLanguage(String lang) {
    defLanguage = lang;
    notifyListeners();
  }
}