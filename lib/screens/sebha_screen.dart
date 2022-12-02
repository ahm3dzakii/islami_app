import 'package:flutter/material.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {

  int counter = 0;
  List <String> tasbeh = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر'
  ];
  String? tasbehSelected = 'سبحان الله';


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset('assets/images/sebha_image.png'),
            const SizedBox(height: 10.0,),
            Text(
              'عدد التسبيحات',
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
                  value: tasbehSelected,
                  dropdownColor: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,
                  onChanged: (String? newValue) {
                    setState(() {
                      tasbehSelected = newValue;
                    });
                  },
                  items: tasbeh.map((chooseTasbeh) {
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

    if(counter == 33 &&  tasbehSelected == tasbeh[0]) {
      counter = 0;
      tasbehSelected = tasbeh[1];
    } else if(counter == 33 &&  tasbehSelected == tasbeh[1]) {
      counter = 0;
      tasbehSelected = tasbeh[2];
    } else if(counter == 33 &&  tasbehSelected == tasbeh[2]) {
      counter = 0;
      tasbehSelected = tasbeh[3];
    } else if(counter == 33 &&  tasbehSelected == tasbeh[3]) {
      counter = 0;
      tasbehSelected = tasbeh[0];
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
