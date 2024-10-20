import 'package:flutter/material.dart';

import '../Colors/colors.dart';
import 'UIText.dart';

class DeliveryCards extends StatelessWidget {
  final AssetImage iconImage;
  final String titleText;
  final String subText;
  final String lastText;
  final AssetImage withdrawIcon;
  final String timeDate;

  const DeliveryCards({
    super.key,
    required this.iconImage,
    required this.titleText,
    required this.subText,
    required this.lastText,
    required this.withdrawIcon,
    required this.timeDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(11),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: iconImage,
                    radius: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiText(
                            text: titleText,
                            textColor: AppColors.darkTxt2,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        UiText(
                            text: subText,
                            textColor: AppColors.lightTxt,
                            fontSize: 14,
                            fontWeight: FontWeight.w400
                        ),
                        Row(
                          children: [
                            UiText(
                                text: lastText,
                                textColor: AppColors.lightTxt,
                                fontSize: 10,
                                fontWeight: FontWeight.w400
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            UiText(
                                text: timeDate,
                                textColor: AppColors.lightTxt,
                                fontSize: 10,
                                fontWeight: FontWeight.w400
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: ImageIcon(
                withdrawIcon, size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
