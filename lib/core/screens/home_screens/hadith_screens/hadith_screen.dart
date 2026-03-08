import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/models/hadith.dart';
import 'package:islami/core/screens/home_screens/hadith_screens/hadith_details_screen.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/text_styles.dart';

import '../../../utils/app_size.dart';
class HadithScreen extends StatefulWidget {

  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  List<Hadith> hadithList = [];
  int SelectedIndex=1;
  Future<void> loadAllHadithFiles() async {
    for (int i = 1; i <= 50; i++) {
      String hadithContent =
      await rootBundle.loadString('assets/Hadeeth/h$i.txt');

      List<String> hadithLines = hadithContent.split("\n");

      String hadithTitle = hadithLines[0];
      hadithLines.removeAt(0);


      hadithList.add(
        Hadith(
          hadithTitle: hadithTitle,
          hadithContent: hadithLines.join("\n"),
        ),
      );
      print(hadithTitle);
    }

    setState(() {});
  }

  @override
  void initState() {
    loadAllHadithFiles();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppSize.init(context);

    return hadithList.isEmpty
        ? Center(child: CircularProgressIndicator())
        : CarouselSlider(
      options: CarouselOptions(
        height: double.infinity,
        enlargeCenterPage: true,
      ),
      items: List.generate(hadithList.length, (index) {
        Hadith hadith = hadithList[index];
        return Padding(
          padding:
          EdgeInsets.symmetric(vertical: AppSize.height * 0.02),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>
                    HadithDetailsScreen(index: index+1,Title: hadith.hadithTitle,Content: hadith.hadithContent,)),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(
                  vertical: AppSize.height * 0.04,
              horizontal: AppSize.width*0.0667),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppAsstes.hadithCarsBg),
                  alignment: Alignment.bottomCenter,
                ),
                color: AppColors.lightMainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Text(
                    hadith.hadithTitle,
                    style: TextStyles.janna24BoldDark,
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: Text(
                      hadith.hadithContent,
                      textAlign: TextAlign.center,
                      style: TextStyles.janna16BoldDar,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
