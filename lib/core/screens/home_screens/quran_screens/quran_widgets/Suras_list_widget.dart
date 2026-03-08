import 'package:flutter/material.dart';

import '../../../../models/database_helper.dart';
import '../../../../utils/app_asstes.dart';
import '../../../../utils/text_styles.dart';
import '../../../details_screens/details_screen.dart';

class SurasListWidget extends StatelessWidget {
  String englishSuraName;
  String arabicSuraName;
  String suraAyaNumbers;
  int suraNumber;
  Function fun;

  SurasListWidget({super.key,required this.arabicSuraName,required this.englishSuraName,required this.suraAyaNumbers,required this.suraNumber,required this.fun});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAsstes.suraListNumberIcon),
            Text(suraNumber.toString(),style: TextStyles.janna20BoldWhite,),
          ],
        ),
      title: Text(englishSuraName,style: TextStyles.janna20BoldWhite),
      subtitle: Text(suraAyaNumbers,style: TextStyles.janna14BoldWhite),
      trailing: Text(arabicSuraName,style: TextStyles.janna20BoldWhite),
      onTap: () async{
        await DatabaseHelper().insertRecent(suraNumber);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailsScreen(suraName: englishSuraName,arabicSuraName: arabicSuraName,suraNumber: suraNumber,)),
        );
        fun();
      },
    );
  }
}
//Row(
//       spacing: 24,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Stack(
//           alignment: Alignment.center,
//           children: [
//             Image.asset(AppAsstes.suraListNumberIcon),
//             Text(suraNumber.toString(),style: TextStyles.janna20BoldWhite,),
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(englishSuraName,style: TextStyles.janna20BoldWhite,),
//             Text(suraAyaNumbers,style: TextStyles.janna14BoldWhite),
//           ],
//         ),
//         Spacer(),
//         Text(arabicSuraName,style: TextStyles.janna20BoldWhite),
//       ],
//     )