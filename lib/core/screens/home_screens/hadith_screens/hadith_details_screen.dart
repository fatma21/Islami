import 'package:flutter/material.dart';

import '../../../utils/app_asstes.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_size.dart';
import '../../../utils/text_styles.dart';

class HadithDetailsScreen extends StatelessWidget {
  int index;
  String Title;
  String Content;
  HadithDetailsScreen({super.key,required this.index,required this.Title,required this.Content});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppColors.lightMainColor
        ),
        backgroundColor: AppColors.darkMianColor,
        title: Text("Hadith $index",style: TextStyles.janna20BoldGold,),
        centerTitle: true,
      ),
      backgroundColor: AppColors.darkMianColor,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(AppAsstes.detailsPageBg),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppSize.height*0.00858),
                child: Text(Title,style: TextStyles.janna20BoldGold,),
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.045,horizontal: AppSize.width * 0.0465),
                    child: Text(Content,style: TextStyles.janna20BoldGold,textAlign: TextAlign.center,),
                  ),
                ),
              ),
              Padding(padding: EdgeInsetsGeometry.all(AppSize.height*0.08))
            ],
          )

        ],
      ),
    );
  }
}
