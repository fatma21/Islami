import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class OnboardWidget extends StatelessWidget {
  String imageName;
  String Title;
  String descreption;
  OnboardWidget({super.key,required this.imageName,required this.Title,this.descreption=""});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          "$imageName",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20),
        Text(
          "$Title",
          style: TextStyle(
            color: AppColors.lightMainColor,
            fontFamily: "Janna LT",
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          "$descreption",
          style: TextStyle(
            color: AppColors.lightMainColor,
            fontFamily: "Janna LT",
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
