import 'package:flutter/material.dart';
import 'package:islami_app/screens/hadeeth/ahadeth_screen.dart';
import 'package:islami_app/screens/quran/quran_screen.dart';
import 'package:islami_app/screens/radio_screen.dart';
import 'package:islami_app/screens/sebha_screen.dart';
import 'package:islami_app/themes/my_theme.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/home_background.png',
          fit: BoxFit.fitWidth,
          width: double.infinity,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('اسلامي', style: Theme.of(context).textTheme.headline1),
          ),
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (index) {
              currentIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/radio_image_icon.png'),
                  size: 30,
                ),
                label: 'الراديو',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/sebha_image_icon.png'),
                  size: 30,
                ),
                label: 'السبحه',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/ahadeth_image_icon.png'),
                  size: 30,
                ),
                label: 'الأحاديث',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/images/quran_image_icon.png'),
                  size: 30,
                ),
                label: 'القرآن',
              ),
            ],
          ),
        ),
      ],
    );
  }

  List <Widget> screens = [
    RadioScreen(),
    SebhaScreen(),
    AhadethScreen(),
    QuranScreen(),
  ];
}