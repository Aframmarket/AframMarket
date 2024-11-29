import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

import '../Colors/colors.dart';
import 'UIText.dart';

class Customaccordian extends StatelessWidget {
  final String heading;
  final String body;
  const Customaccordian({super.key, required this.heading, required this.body});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2,
                color: AppColors.borderColor4
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: ExpandableTheme(
          data: ExpandableThemeData(
            useInkWell: false,
            animationDuration: const Duration(milliseconds: 500),
          ),
          child: ExpandablePanel(
            theme: ExpandableThemeData(iconColor: AppColors.primaryYellowColor, expandIcon: Icons.remove, collapseIcon: Icons.add,),
            header: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: UiText(text: heading, textAlign: TextAlign.start, textColor: AppColors.darkTxt, fontSize: 14, fontWeight: FontWeight.w400,),
            ),
            expanded: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: UiText(text: body,
                textColor: AppColors.greyTxt, fontSize: 14, fontWeight: FontWeight.w400,),
            ), collapsed: SizedBox(),),
        ),
      ),
    );
  }
}
