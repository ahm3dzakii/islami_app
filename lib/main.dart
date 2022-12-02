import 'package:flutter/material.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/screens/hadeeth/hadeeth_details_screen.dart';
import 'package:islami_app/screens/quran/sura_details/sura_details_screen.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProviders()),
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) =>  HomeScreen(),
        SuraDetailsScreen.routeName:(context) => SuraDetailsScreen(),
        HadeethDetailsScreen.routeName:(context) => HadeethDetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.isDarkLight,
    );
  }
}
