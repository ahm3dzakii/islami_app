import 'package:flutter/material.dart';
import 'package:islami_app/screens/hadeeth/ahadeth_screen.dart';
import 'package:islami_app/themes/my_theme.dart';

class HadeethDetailsScreen extends StatelessWidget {

  static const String routeName = 'HadeethDetailsScreen';

  @override
  Widget build(BuildContext context) {
    HadeethData args = ModalRoute.of(context)?.settings.arguments as HadeethData;
    return Stack(
      children: [
        Image.asset(
          'assets/images/home_background.png',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(args.title,
                style: Theme.of(context).textTheme.headline1),
          ),
          body: args.content.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Container(
            margin: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 50.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border:
              Border.all(color: MyThemeData.colorGold, width: 2.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Expanded(
              child: ListView.builder(
                  itemCount: args.content.length,
                  itemBuilder: (_, index) {
                    return Text(args.content[index], style: Theme.of(context).textTheme.subtitle1,);
                  }),
            ),
          ),
        ),
      ],
    );
  }
}

class HadeethDetailsArgs {
  //Data Class (Model)
  String hadeethTitle;
  int index;

  HadeethDetailsArgs(this.hadeethTitle, this.index);
}