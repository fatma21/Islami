import 'package:flutter/material.dart';


class RadioButtonWidget extends StatelessWidget {
  String buttonText;
  Color buttonColor;
  TextStyle buttonTextStyle;
  RadioButtonWidget({super.key, required this.buttonText,required this.buttonColor,required this.buttonTextStyle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(12)
        ),
        child: Text(buttonText,style: buttonTextStyle,textAlign: TextAlign.center,),
      ),
    );
  }
}
