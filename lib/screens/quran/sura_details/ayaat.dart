import 'package:flutter/material.dart';
import 'package:islami_app/themes/my_theme.dart';

class AyaatItem extends StatelessWidget {

  String ayaat;
  AyaatItem(this.ayaat);

  @override
  Widget build(BuildContext context) {
    return Text(ayaat, style: Theme.of(context).textTheme.subtitle1, textAlign: TextAlign.center);
  }
}
