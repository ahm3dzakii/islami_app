import 'package:flutter/material.dart';

class MyProviders extends ChangeNotifier {

  ThemeMode isDarkLight = ThemeMode.light;
  bool isDark = false;

  void isDarkLightMood(ThemeMode themeMode) {
    isDarkLight = themeMode;
    isDark = !isDark;
    notifyListeners();
  }

}