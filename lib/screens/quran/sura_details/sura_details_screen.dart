import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/screens/quran/sura_details/ayaat.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'SuraDetailsScreen';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayaat = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (ayaat.isEmpty) {
      loadFile(args.index);
    }
    return Stack(
      children: [
        Image.asset(
          provider.isDark? 'assets/images/dark_mode_background.png' : 'assets/images/home_background.png',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(args.suraName,
                style: Theme.of(context).textTheme.headline1),
          ),
          body: ayaat.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Container(
            margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 50.0),
                  decoration: BoxDecoration(
                    color: provider.isDark? MyThemeData.darkPrimaryBlue : Colors.grey.shade400,
                    border:
                        Border.all(color: MyThemeData.colorGold, width: 2.0),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListView.builder(
                      itemCount: ayaat.length,
                      itemBuilder: (_, index) {
                        return AyaatItem(ayaat[index]);
                      }),
                ),
        ),
      ],
    );
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = content.split('\n');
    ayaat = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  //Data Class (Model)
  String suraName;
  int index;

  SuraDetailsArgs(this.suraName, this.index);
}
