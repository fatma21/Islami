import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/screens/home_screens/radio_screens/radio_widgets/radio_button.dart';
import 'package:islami/core/screens/home_screens/radio_screens/radio_widgets/radio_list_widget.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/text_styles.dart';
import '../../../utils/app_size.dart';


class RadioScreen extends StatefulWidget {
  RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadio=true;
  bool play=false;
  int? currentPlayingIndex;
  List<String> radioNames = [
    "Radio1",
    "Radio2",
    "Radio3",
    "Radio4",
    "Radio5",
  ];
  void playFunc(){
    play=!play;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
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
                child: InkWell(
                    onTap: (){
                      isRadio=true;
                      setState(() {

                      });
                    },
                    child: RadioButtonWidget(buttonText: "Radio", buttonColor: isRadio?AppColors.lightMainColor:Colors.transparent, buttonTextStyle: isRadio?TextStyles.janna16BoldDar:TextStyles.janna16BoldWhite)),
              ),
              Expanded(
                child: InkWell(
                    onTap: (){
                      isRadio=false;
                      setState(() {

                      });
                    },
                    child: RadioButtonWidget(buttonText: "Reciters", buttonColor: isRadio?Colors.transparent:AppColors.lightMainColor, buttonTextStyle: isRadio?TextStyles.janna16BoldWhite:TextStyles.janna16BoldDar)),
              ),
            ],
          )
        ),
        SizedBox(height: AppSize.height*0.02,),
        Expanded(
          child: ListView.separated(
              itemBuilder: (context,index){
                return RadioListWidget(
                  play: currentPlayingIndex == index
                  , name: radioNames[index],
                  fun: (){
                    setState(() {
                      if (currentPlayingIndex == index) {
                        currentPlayingIndex = null; // stop
                      } else {
                        currentPlayingIndex = index; // play this radio
                      }
                    });
                  },);
              },
            itemCount: radioNames.length,
            separatorBuilder: (context,index){
                return SizedBox( height:AppSize.height*0.02,);
            },
          ),
        )

      ],
    );
  }
}
