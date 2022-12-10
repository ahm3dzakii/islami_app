import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/provider/dark_mood_provider.dart';
import 'package:islami_app/screens/hadeeth/hadeeth_details_screen.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class AhadethScreen extends StatefulWidget {
  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<HadeethData> ahadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of <MyProviders> (context);
    if (ahadeth.isEmpty) {
      loadAhadethFile();
    }
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset('assets/images/ahadeth_image.png'),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          Text(
            AppLocalizations.of(context)!.ahadethScreenSubTitle,
            style: Theme.of(context).textTheme.headline1,
          ),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          ahadeth.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      color: MyThemeData.colorGold,
                      thickness: 0.5,
                      indent: 20.0,
                      endIndent: 20.0,
                    ),
                    itemCount: ahadeth.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HadeethDetailsScreen.routeName, arguments: ahadeth[index]);
                        },
                        child: Text(
                          ahadeth[index].title,
                          style: Theme.of(context).textTheme.subtitle1,
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }

  void loadAhadethFile() async {
    String ahadethContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadeth = ahadethContent.trim().split('#\r\n');
    for (int i = 0; i < allAhadeth.length; i++) {
      String hadeeth = allAhadeth[i];
      List<String> hadeethLines = hadeeth.split('\n');
      String title = hadeethLines[0];
      hadeethLines.removeAt(0);
      HadeethData hadeethData = HadeethData(title, hadeethLines);
      ahadeth.add(hadeethData);
      setState(() {});
    }
  }
}

class HadeethData {
  String title;
  List<String> content;

  HadeethData(this.title, this.content);
}
