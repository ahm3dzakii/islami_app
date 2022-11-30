import 'package:flutter/material.dart';
import 'package:islami_app/screens/quran/sura_name_item.dart';
import 'package:islami_app/themes/my_theme.dart';

class QuranScreen extends StatelessWidget {

  List <String> suraName = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset('assets/images/quran_image.png'),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          Text(
            'السور',
            style: Theme.of(context).textTheme.headline1,
          ),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: MyThemeData.colorGold,
                  endIndent: 25.0,
                  indent: 25.0,
                ),
                itemCount: suraName.length,
                  itemBuilder: (context,index) {
                return SuraNameItem(suraName[index], index);
              }),
          ),
        ],
      ),
    );
  }
}
