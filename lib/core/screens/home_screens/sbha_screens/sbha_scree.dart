import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_size.dart';
import 'package:islami/core/utils/text_styles.dart';

class SbhaScreen extends StatefulWidget {
  const SbhaScreen({super.key});

  @override
  State<SbhaScreen> createState() => _SbhaScreenState();
}

class _SbhaScreenState extends State<SbhaScreen> {
  double angle = 0;
  List<String>tasby7=["سبحان الله","الحمد لله","الله اكبر"];
  int count=0;
  int sbhaIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ",style: TextStyles.janna36BoldWhite,),
          InkWell(
            onTap: (){
              setState(() {
                angle += 0.5;
                if(count==30){
                  count=0;
                  if(sbhaIndex<2){
                    ++sbhaIndex;
                  }
                  else{
                    sbhaIndex=0;
                  }
                }
                else{
                  ++count;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: angle,
                  alignment: Alignment.center,
                  origin: Offset(0, 30),
                  child: Image.asset(AppAsstes.sbhaImage,width: 300,),
                ),Column(
                  children: [
                    SizedBox(height: AppSize.height*0.09,),
                    Text(tasby7[sbhaIndex],style: TextStyles.janna36BoldWhite,),
                    Text(count.toString(),style: TextStyles.janna36BoldWhite),
                  ],
                )
              ],
            ),
          )
        ],
    );
  }
}
