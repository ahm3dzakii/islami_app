import 'package:flutter/material.dart';

class MyProviders extends ChangeNotifier {

  ThemeMode isDarkLight = ThemeMode.dark;
  bool isDark = true;

  void isDarkLightMood(ThemeMode themeMode) {
    isDarkLight = themeMode;
    isDark = !isDark;
    notifyListeners();
  }

}