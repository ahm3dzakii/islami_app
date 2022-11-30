import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = const Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorWhite = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color colorGold = const Color.fromRGBO(183, 147, 95, 1.0);

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: colorBlack),
        subtitle1: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: colorBlack),
      subtitle2: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: colorWhite),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorGold,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
  );
}
