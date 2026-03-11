import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/core/screens/home_screens/time_screens/time_screen_widgets/grid_widget.dart';
import 'package:islami/core/screens/home_screens/time_screens/time_screen_widgets/time_and_date_widget.dart';
import 'package:islami/core/utils/app_asstes.dart';
import 'package:islami/core/utils/app_colors.dart';
import 'package:islami/core/utils/text_styles.dart';

import '../../../utils/app_size.dart';


class TimeScreen extends StatelessWidget {
  TimeScreen({super.key});
  List<String>salah=["Fajr","Dhuhur","Asr","Maghrib","Asha"];
  List<String>salahTime=["05:00","12:00","03:00","06:00","07:00"];
  List<String>azkarImage=[AppAsstes.eveningAzkar,AppAsstes.morningAzkar,AppAsstes.wakingAzkar,AppAsstes.sleepingAzkar];
  List<String>azkarTitle=["Evening Azkar","Morning Azkar","Walking Azkar","Sleeping Azkar"];
  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: AppSize.width * 0.07
              ,horizontal: AppSize.height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: DecorationImage(
                image: AssetImage(AppAsstes.salahTimeBG),fit: BoxFit.fill),
            color: Color(0xFF856B3F),
          ),
          child: Column(
            spacing: 20,
            children: [
              Row(
                children: [
                  TimeAndDateWidget(line1: "16 Jul,", line2: "2024", axix: CrossAxisAlignment.start),
                  TimeAndDateWidget(line1: "Pray Time", line2: "Tuesday", axix: CrossAxisAlignment.center,textStyle: TextStyles.janna20BoldDark,),
                  TimeAndDateWidget(line1: "09 Muh,", line2: "1446", axix: CrossAxisAlignment.end),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.50,
                ),
                items: List.generate(salah.length, (index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF202020),
                          Color(0xFFB19768),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 15,
                      children: [
                        Text(salah[index],style: TextStyles.janna16BoldWhite,),
                        Text(salahTime[index],style: TextStyles.janna36BoldWhite),
                        Text("PM",style: TextStyles.janna16BoldWhite),
                      ],
                    ),
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text("Next Pray - 02:32",style: TextStyles.janna16BoldDar,),
                  Spacer(),
                  Icon(Icons.volume_up)
                ],
              )
            ],
          ),
        ),
        Text("Azkar",style: TextStyles.janna16BoldWhite,),
        Expanded(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,
                mainAxisSpacing: 10,childAspectRatio: 0.70),
              itemCount: azkarTitle.length,
              itemBuilder: (context,index){
                return GridWidget(image: azkarImage[index], title: azkarTitle[index]);
              }
          ),
        )
      ],
    );
  }
}
