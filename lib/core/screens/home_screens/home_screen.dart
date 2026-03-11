import 'package:flutter/material.dart';
import 'package:islami/core/screens/appbar/appbar_widget.dart';
import 'package:islami/core/screens/home_screens/hadith_screens/hadith_screen.dart';
import 'package:islami/core/screens/home_screens/quran_screens/quran_screen.dart';
import 'package:islami/core/screens/home_screens/radio_screens/radio_screen.dart';
import 'package:islami/core/screens/home_screens/sbha_screens/sbha_scree.dart';
import 'package:islami/core/screens/home_screens/time_screens/time_screens.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_asstes.dart';
import '../../utils/app_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String>bgImage=[AppAsstes.quranbg,AppAsstes.hadithbg,AppAsstes.sbhabg,AppAsstes.radiobg,AppAsstes.timebg];
  List<Widget>pageContent=[QuranScreen(),HadithScreen(),SbhaScreen(),RadioScreen(),TimeScreen()];
  Widget bottomNavBarIcon({required int index,required String icon}){
    return selectedIndex == index ?
      Container(
        padding: EdgeInsets.symmetric(vertical: 6,horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.darkbgColor
        ),
        child: ImageIcon(AssetImage(icon))):
    ImageIcon(AssetImage(icon));
  }
  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSize.width*0.05),
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgImage[selectedIndex]),fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/Group 31.png",width: 150,height: 150,),
              Expanded(child: pageContent[selectedIndex])
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.lightMainColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          iconSize: 30,
          items: [
            BottomNavigationBarItem(icon: bottomNavBarIcon(index: 0,icon: AppAsstes.quran),label: "Quran"),
            BottomNavigationBarItem(icon: bottomNavBarIcon(index: 1,icon: AppAsstes.hadith),label: "Hadith"),
            BottomNavigationBarItem(icon: bottomNavBarIcon(index: 2,icon: AppAsstes.sbha),label: "Hadith"),
            BottomNavigationBarItem(icon: bottomNavBarIcon(index: 3,icon: AppAsstes.radio),label: "Radio"),
            BottomNavigationBarItem(icon: bottomNavBarIcon(index: 4,icon: AppAsstes.time),label: "Time"),
          ]
      ),
    );
  }
}
