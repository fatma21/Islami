import 'package:flutter/material.dart';
import 'package:islami/core/utils/text_styles.dart';

import '../../../../utils/app_colors.dart';

class GridWidget extends StatelessWidget {
  String image;
  String title;
  GridWidget({super.key,required this.image,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.darkMianColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.lightMainColor,width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          Text(title,style: TextStyles.janna20BoldWhite,),
        ],
      ),
    );
  }
}
