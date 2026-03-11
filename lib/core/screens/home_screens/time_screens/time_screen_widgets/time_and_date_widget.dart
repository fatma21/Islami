import 'package:flutter/material.dart';
import '../../../../utils/text_styles.dart';


class TimeAndDateWidget extends StatelessWidget {
  String line1;
  String line2;
  CrossAxisAlignment axix;
  TextStyle textStyle;
  TimeAndDateWidget({super.key,required this.line1,required this.line2,required this.axix, this.textStyle=TextStyles.janna16BoldWhite});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: axix,
        children: [
          Text(line1,style: textStyle,),
          Text(line2,style: textStyle)
        ],
      ),
    );
  }
}
