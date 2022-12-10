import 'package:flutter/material.dart';
import 'package:islami_app/provider/change_language_provider.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaScreen extends StatefulWidget {

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {

  int counter = 0;
  List <String> tasbehArabic = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر'
  ];
  List <String> tasbehEnglish = [
    'Hallelujah',
    'Elhamdulelah',
    'La ilaha illallah',
    'Allahu akbar'
  ];
  String? tasbehSelectedArabic = 'سبحان الله';
  String? tasbehSelectedEnglish = 'Hallelujah';


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    var languageProvider = Provider.of <ChangeLanguageProvider> (context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/images/sebha_image.png'),
            const SizedBox(height: 10.0,),
            Text(
              AppLocalizations.of(context)!.sebhaScreenSubTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 20.0,),
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('$counter', style: Theme.of(context).textTheme.subtitle2, textAlign: TextAlign.center,),
                ],
              ),
            ),
            const SizedBox(height: 10.0,),
            Container(
              decoration: BoxDecoration(
                color: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  iconSize: 40,
                  iconEnabledColor: provider.isDark? MyThemeData.darkPrimaryBlue : MyThemeData.colorWhite,
                  style: Theme.of(context).textTheme.subtitle2,
                  borderRadius: BorderRadius.circular(20.0),
                  value: languageProvider.defLanguage == 'ar'? tasbehSelectedArabic : tasbehSelectedEnglish,
                  dropdownColor: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,
                  onChanged: (String? newValue) {
                    setState(() {
                      languageProvider.defLanguage == 'ar'? tasbehSelectedArabic = newValue : tasbehSelectedEnglish = newValue;
                    });
                  },
                  items: languageProvider.defLanguage == 'ar'? tasbehArabic.map((chooseTasbeh) {
                    return DropdownMenuItem(
                      value: chooseTasbeh,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(chooseTasbeh, textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    );
                  }).toList() : tasbehEnglish.map((chooseTasbehh) {
                    return DropdownMenuItem(
                      value: chooseTasbehh,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(chooseTasbehh, textAlign: TextAlign.center,),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          incrementCounter();
        },
        backgroundColor: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,
        child:  Icon(Icons.add, color: provider.isDark? MyThemeData.darkPrimaryBlue : MyThemeData.colorWhite,),
      ),
    );
  }

  void incrementCounter () {

    if(counter == 33 &&  (tasbehSelectedArabic == tasbehArabic[0] || tasbehSelectedEnglish == tasbehEnglish[0]) ) {
      counter = 0;
      tasbehSelectedArabic = tasbehArabic[1];
      tasbehSelectedEnglish = tasbehEnglish[1];
    } else if(counter == 33 &&  (tasbehSelectedArabic == tasbehArabic[1] || tasbehSelectedEnglish == tasbehEnglish[1]) ) {
      counter = 0;
      tasbehSelectedArabic = tasbehArabic[2];
      tasbehSelectedEnglish = tasbehEnglish[2];
    } else if(counter == 33 &&  (tasbehSelectedArabic == tasbehArabic[2] || tasbehSelectedEnglish == tasbehEnglish[2]) ) {
      counter = 0;
      tasbehSelectedArabic = tasbehArabic[3];
      tasbehSelectedEnglish = tasbehEnglish[3];
    } else if(counter == 33 &&  (tasbehSelectedArabic == tasbehArabic[3] || tasbehSelectedEnglish == tasbehEnglish[3]) ) {
      counter = 0;
      tasbehSelectedArabic = tasbehArabic[0];
      tasbehSelectedEnglish = tasbehEnglish[0];
    } else {
      counter++;
    }
    setState (() {

    });
  }
}

class tasbehIndex {
  int index;
  tasbehIndex(this.index);
}
