import 'package:flutter/material.dart';
import 'package:islami_app/provider/change_language_provider.dart';
import 'package:islami_app/screens/quran/sura_name_item.dart';
import 'package:islami_app/themes/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class QuranScreen extends StatelessWidget {

  List <String> suraNameArabic = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
    ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
    ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
    ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
    ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
    ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
    ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
    ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
    ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
    "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];

  List <String> suraNameEnglish = ['Al-Fateha', 'Al-Bakara', 'Al-Emran', 'Al-Nesaa', 'Al-Maeda', 'Al-Anaam', 'Al-Aaraf',
    'Al-Anfal', 'Al-Tawba', 'Younos', 'Hood', 'Yusuf', 'Al-Raad', 'Ibrahim', 'Al-Hejr', 'Al-Nahl', 'Al-Esraa', 'Al-Kahf', 'Mariam',
    'Taha', 'Al-Anbiaa', 'Al-Haj', 'Al-Moamenon', 'Al-Nour', 'Al-Forkan', 'Al-Shoaraa', 'Al-Naml', 'Al-Kasas', 'Al-Ankabot', 'Al-Rom', 'Lokman',
    'Al-Sajda', 'Al-Ahzab', 'Sabaa', 'Fater', 'Yassein', 'Al-Saffat', 'Sadd', 'Al-Zomar', 'Ghafer', 'Fosselat', 'Al-Shora', 'Al-Zokhrof',
    'Al-Dokhan', 'Al-Jathia', 'Al-Ahkaf', 'Muhammad', 'Al-Fath', 'Al-Hojorat', 'kaf', 'Al-Zariat', 'Al-Tor', 'Al-Najm', 'Al-Kamar', 'Al-Rahman',
    'Al-Wakea', 'Al-Hadid', 'Al-Mojadala', 'Al-Hashr', 'Al-Momtahana', 'Al-Saf', 'Al-Jomoa', 'Al-Monafekon', 'Al-Taghabon', 'Al-Talak',
    'Al-Tahreem', 'Al-Molk', 'Al-kalam', 'Al-Hakka', 'Al-Maarej', 'Nouh', 'Al-Jen', 'Al-Mozamil', 'Al-Modather', 'Al-Keiama', 'Al-Ensan',
    'Al-Morssalat', 'Al-Nabaa', 'Al-Nazeat', 'Abasa', 'Al-Takwir', 'Al-Enfetar', 'Al-Motaffefin', 'Al-Enshekak', 'Al-Boroj', 'Al-Tarek', 'Al-Aala',
    'Al-Ghashia', 'Al-Fajr', 'Al-Balad', 'Al-Shams', 'Al-Lail', 'Al-Doha', 'Al-Sharh', 'Al-Teen', 'Al-Alak', 'Al-kadr', 'Al-Baiena', 'Al-Zalzala',
    'Al-Adiat', 'Al-Karea', 'Al-Takathor', 'Al-Asr', 'Al-Homaza', 'Al-Feel', 'Koraish', 'Al-Maaon', 'Al-Kawthar', 'Al-Kaferon', 'Al-Nasr',
    'Al-Masad', 'Al-Ekhlas', 'Al-Falak', 'Al-Nas'];

  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of <ChangeLanguageProvider> (context);
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Image.asset('assets/images/quran_image.png'),
          Divider(color: MyThemeData.colorGold, thickness: 1.0),
          Text(
            AppLocalizations.of(context)!.quranScreenSubTitle,
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
                itemCount: languageProvider.defLanguage == 'ar'? suraNameArabic.length : suraNameEnglish.length,
                  itemBuilder: (context,index) {
                return SuraNameItem(languageProvider.defLanguage == 'ar'? suraNameArabic[index] : suraNameEnglish[index], index);
              }),
          ),
        ],
      ),
    );
  }
}
