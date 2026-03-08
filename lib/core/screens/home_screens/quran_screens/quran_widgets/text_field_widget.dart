import 'package:flutter/material.dart';

import '../../../../utils/app_asstes.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/text_styles.dart';

class TextFieldWidget extends StatelessWidget {
  final ValueChanged<String> fun;
  TextFieldWidget({super.key,required this.fun});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: TextStyles.janna16BoldWhite,
      decoration: InputDecoration(
        prefixIcon: Image.asset(AppAsstes.quran,color: AppColors.lightMainColor,),
        hintText: "Sura Name",
        hintStyle: TextStyles.janna16BoldWhite,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lightMainColor)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: AppColors.lightMainColor)
        ),
        focusColor: Colors.white,
        fillColor: AppColors.darkbgColor,

      ),
      onChanged: fun,
    );
  }
}
