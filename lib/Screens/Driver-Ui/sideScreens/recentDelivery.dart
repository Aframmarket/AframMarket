import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:flutter/material.dart';

import '../../Reusables/deliveryCards.dart';


class RecentDeliveryScreen extends StatelessWidget {
  const RecentDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            SizedBox(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.all(10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.lightGreyBg2
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  UiText(text: "Recent Delivery", textColor: AppColors.darkTxt3, fontSize: 17, fontWeight: FontWeight.w400)
                ],
              ),
            ),
            DeliveryCards(
                iconImage: AssetImage("assets/foodIcon.png"),
                titleText: "ID:#32053",
                subText: "Protein (1KG) . Olu Store",
                lastText: "Delivered",
                withdrawIcon: AssetImage("assets/recipt.png"),
                timeDate: "4th July"
            ),
          ],
        ),
      ),
    );
  }
}
