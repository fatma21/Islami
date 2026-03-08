import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/text_styles.dart';

class RadioScreen extends StatelessWidget {
  const RadioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.darkbgColor
          ),
          child:Row(
            children: [
              Expanded(
                child: Container(
                  //color: AppColors.lightMainColor,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.lightMainColor,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Text("Radio",style: TextStyles.janna16BoldDar,textAlign: TextAlign.center,),
                ),
              ),
              Expanded(
                child: Container(
                  child: Text("Radio",style: TextStyles.janna16BoldWhite,textAlign: TextAlign.center,),
                ),
              )
            ],
          )
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppAsstes.hadithCarsBg)),
            color: AppColors.lightMainColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("RADIO"),
              Row(
                children: [
                  Icon(Icons.play_arrow_rounded,color: AppColors.darkMianColor,),
                  Icon(Icons.volume_up,color: AppColors.darkMianColor,)
                ],
              )
            ],
          ),
        )

      ],
    );
  }
}
