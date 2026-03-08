import 'package:flutter/material.dart';

import '../../../../utils/app_asstes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/text_styles.dart';

class MostRecentlyCard extends StatelessWidget {
  String engishName;
  String arabicName;
  String verses;
  MostRecentlyCard({super.key,required this.engishName,required this.arabicName,required this.verses});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17,vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.lightMainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(engishName,style: TextStyles.janna24BoldDark,),
              Text(arabicName,style: TextStyles.janna24BoldDark),
              Text("$verses Verses",style: TextStyles.janna14BoldDark,),
            ],
          ),
          Image.asset(AppAsstes.mostRecently),
        ],
      ),
    );
  }
}
