import 'package:flutter/material.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 100.0,),
          Image.asset('assets/images/radio_image.png'),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          Text(
            AppLocalizations.of(context)!.radioScreenSubTitle,
            style: Theme.of(context).textTheme.headline1,
          ),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ImageIcon(AssetImage('assets/images/prev_image_icon.png'), color: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,),
                ImageIcon(AssetImage('assets/images/play_pause_image_icon.png'), color: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,),
                ImageIcon(AssetImage('assets/images/next_image_icon.png'), color: provider.isDark? MyThemeData.darkPrimaryGold : MyThemeData.colorGold,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
