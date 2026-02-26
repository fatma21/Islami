 import 'package:flutter/material.dart';
import 'package:islami/core/screens/appbar/appbar_widget.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_asstes.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  List<String>bgImage=[AppAsstes.quranbg,AppAsstes.hadithbg,AppAsstes.sbhabg,AppAsstes.radiobg,AppAsstes.timebg];
  Widget bottomNavBarIcon({required int index,required String icon}){
    return selectedindex == index ?
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(bgImage[selectedindex]),fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("assets/images/Group 31.png",width: 150,height: 150,)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedindex,
        onTap: (index){
          setState(() {
            selectedindex = index;
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
