import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack = const Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorWhite = const Color.fromRGBO(255, 255, 255, 1.0);
  static Color colorGold = const Color.fromRGBO(183, 147, 95, 1.0);
  static Color darkPrimaryBlue = const Color.fromRGBO(20, 26, 46, 1.0);
  static Color darkPrimaryGold = const Color.fromRGBO(250, 204, 29, 1.0);

  static ThemeData lightTheme = ThemeData(
    primaryColor: colorGold,
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
      unselectedItemColor: colorWhite,
      selectedItemColor: colorBlack,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimaryBlue,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme:  AppBarTheme(
      iconTheme: IconThemeData(
        color: colorWhite,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: colorWhite),
      subtitle1: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: darkPrimaryGold),
      subtitle2: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w500, color: darkPrimaryBlue),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkPrimaryBlue,
      unselectedItemColor: colorWhite,
      selectedItemColor: darkPrimaryGold,
    ),
  );
}
