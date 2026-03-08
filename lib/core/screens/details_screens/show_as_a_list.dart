import 'package:flutter/material.dart';
import 'package:islami/core/utils/app_colors.dart';

import '../../utils/app_size.dart';
import '../../utils/text_styles.dart';

class ShowAsAList extends StatefulWidget {
  List<String> suraList=[];
  ShowAsAList({super.key,required this.suraList});

  @override
  State<ShowAsAList> createState() => _ShowAsAListState();
}

class _ShowAsAListState extends State<ShowAsAList> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    AppSize.init(context);
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
            vertical: AppSize.height * 0.045, horizontal: AppSize.width * 0.0465),
        itemCount: widget.suraList.length,
        itemBuilder: (context, index) {
          bool isSelected = selectedIndex == index; // check if this index is selected
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index; // update selected index
              });
            },
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.lightMainColor,
                ),
                color: isSelected ? AppColors.lightMainColor : Colors.transparent, // change color
              ),
              child: Text(
                "${widget.suraList[index]} (${index + 1})",
                style: isSelected ? TextStyles.janna20BoldDark : TextStyles.janna20BoldWhite,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: AppSize.height * 8 / 932,
          );
        },
      ),
    );
  }
}
