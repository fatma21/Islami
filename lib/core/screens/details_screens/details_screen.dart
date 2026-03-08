import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/screens/details_screens/show_as_a_list.dart';
import 'package:islami/core/screens/details_screens/show_as_string_widget.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/text_styles.dart';

import '../../utils/app_size.dart';

class DetailsScreen extends StatefulWidget {
  String suraName;
  String arabicSuraName;
  int suraNumber;
  DetailsScreen({super.key,required this.suraName,required this.arabicSuraName,required this.suraNumber});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String suraContent = "";
  List<String> verses = [];
  String Suraaaa=" ";
  bool showScreen=true;
  @override
  void initState() {
    super.initState();
    loadSuraFile(widget.suraNumber);
  }

  void loadSuraFile(int index) async{
    String suraContent = await rootBundle.loadString(
      'assets/Suras/$index.txt',
    );
    verses=suraContent.split("\n");
    List<String>lines=suraContent.split("\n");
    for(int i=0;i<verses.length;i++){
      lines[i]+="[${i+1}]";
    }
    Suraaaa=lines.join(" ");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.lightMainColor
        ),
        backgroundColor: AppColors.darkMianColor,
        title: Text(widget.suraName,style: TextStyles.janna20BoldGold,),
        centerTitle: true,
        actions: [
          IconButton(
            icon: showScreen
                ? Icon(Icons.view_agenda_outlined,color: AppColors.lightMainColor,)
                : Icon(Icons.filter_list,color: AppColors.lightMainColor),
            onPressed: () {
              setState(() {
                showScreen = !showScreen;
              });
            },
          ),
        ],
      ),
      backgroundColor: AppColors.darkMianColor,
      body: verses.isEmpty
          ? const Center(
        child: CircularProgressIndicator(),
      ) :
    Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AppAsstes.detailsPageBg),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.height*0.00858),
                child: Text(widget.arabicSuraName,style: TextStyles.janna20BoldGold,),
              ),

              showScreen
                  ? ShowAsStringWidget(SuraText: Suraaaa)
                  : ShowAsAList(suraList: verses),
              Padding(padding: EdgeInsetsGeometry.all(AppSize.height*0.08))
            ],
          )

        ],
      ),
    );
  }
}
