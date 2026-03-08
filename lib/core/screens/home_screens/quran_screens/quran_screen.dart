import 'package:flutter/material.dart';
import 'package:islami/core/models/suras_list.dart';
import 'package:islami/core/screens/details_screens/details_screen.dart';
import 'package:islami/core/screens/home_screens/quran_screens/quran_widgets/Suras_list_widget.dart';
import 'package:islami/core/screens/home_screens/quran_screens/quran_widgets/most_recently_card.dart';
import 'package:islami/core/screens/home_screens/quran_screens/quran_widgets/text_field_widget.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/app_size.dart';
import 'package:islami/core/utils/text_styles.dart';
import '../../../models/database_helper.dart';

class QuranScreen extends StatefulWidget {

  QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  //List<Widget>mostRecentSura=[MostRecentlyCard(),MostRecentlyCard(),MostRecentlyCard()];

  SurasList quranSurasList = SurasList();
  List<int> displayedSuras = [];
  void searchSura(String query) {
    setState(() {
      if (query.isEmpty) {
        displayedSuras =
            List.generate(quranSurasList.englishQuranSurahs.length, (i) => i);
      } else {
        displayedSuras =
            List.generate(quranSurasList.englishQuranSurahs.length, (i) => i)
                .where((index) {
              final arabic = quranSurasList.arabicAuranSuras[index];
              final english = quranSurasList.englishQuranSurahs[index];

              return arabic.contains(query) ||
                  english.toLowerCase().contains(query.toLowerCase());
            }).toList();
      }
    });
  }
  List<int> recentSuras = [];
  void loadRecent() async {
    recentSuras = await DatabaseHelper().getRecentSuras();
    setState(() {});
  }
  @override
  void initState() {
    super.initState();
    loadRecent();
    displayedSuras =
        List.generate(quranSurasList.englishQuranSurahs.length, (i) => i);
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldWidget(fun: searchSura,),
        SizedBox(height: 10,),
        Text("Most Recently",style: TextStyles.janna16BoldWhite,),
        Visibility(
          visible: recentSuras.isNotEmpty,
          child: SizedBox(
            height: AppSize.height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recentSuras.length,
              itemBuilder: (context, index) {

                int suraIndex = recentSuras[index] - 1;

                return MostRecentlyCard(
                  engishName: quranSurasList.englishQuranSurahs[suraIndex],
                  arabicName: quranSurasList.arabicAuranSuras[suraIndex],
                  verses: quranSurasList.AyaNumber[suraIndex],
                );
              },
              separatorBuilder: (context,index) => SizedBox(width: 20),
            ),
          ),
        ),
        Text("Suras List",style: TextStyles.janna16BoldWhite,),
        Expanded(
          child: ListView.separated(
            itemCount: displayedSuras.length,
            itemBuilder: (context, index) {
              int suraIndex = displayedSuras[index];

              return SurasListWidget(
                arabicSuraName: quranSurasList.arabicAuranSuras[suraIndex],
                englishSuraName: quranSurasList.englishQuranSurahs[suraIndex],
                suraAyaNumbers: quranSurasList.AyaNumber[suraIndex],
                suraNumber: suraIndex + 1,
                fun: loadRecent,
              );
            },
            separatorBuilder: (context, index) {
              return Divider(
                indent: AppSize.width * 0.12,
                endIndent: AppSize.width * 0.12,
                thickness: 1,
                color: Colors.white,
              );
            },
          ),
        ),
      ],
    );
  }
}
