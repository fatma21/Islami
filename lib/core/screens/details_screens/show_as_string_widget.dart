import 'package:flutter/material.dart';

import '../../utils/app_size.dart';
import '../../utils/text_styles.dart';

class ShowAsStringWidget extends StatelessWidget {
  String SuraText;
  ShowAsStringWidget({super.key,required this.SuraText});

  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSize.height * 0.045,horizontal: AppSize.width * 0.0465),
          child: Text(SuraText,style: TextStyles.janna20BoldGold,textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
