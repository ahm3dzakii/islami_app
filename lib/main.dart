import 'package:flutter/material.dart';
import 'package:islami_app/provider/change_language_provider.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/screens/hadeeth/hadeeth_details_screen.dart';
import 'package:islami_app/screens/quran/sura_details/sura_details_screen.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:islami_app/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp( MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MyProviders()),
      ChangeNotifierProvider(create: (context) => ChangeLanguageProvider()),
    ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    var langProvider = Provider.of <ChangeLanguageProvider> (context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(langProvider.defLanguage),
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
