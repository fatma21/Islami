import 'package:flutter/material.dart';

import '../../../../utils/app_asstes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/text_styles.dart';


class RadioListWidget extends StatelessWidget {
  String name;
  bool play;
  Function fun;
  RadioListWidget({super.key,required this.play,required this.name,required this.fun});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(play?AppAsstes.radioPlayed:AppAsstes.radioPlay,),alignment: Alignment.bottomCenter,),
          color: AppColors.lightMainColor,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //spacing: 10,
        children: [
          Text(name,textAlign: TextAlign.center,style: TextStyles.janna20BoldDark,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              InkWell(
                  onTap: (){
                    fun();
                  },
                  child: Icon(play?Icons.pause:Icons.play_arrow_rounded,color: AppColors.darkMianColor,size: 40,)),
              Icon(Icons.volume_up,color: AppColors.darkMianColor,size: 25,)
            ],
          )
        ],
      ),
    );
  }
}
