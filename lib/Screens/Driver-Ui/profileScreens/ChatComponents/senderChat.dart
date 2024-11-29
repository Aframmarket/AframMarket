import 'package:flutter/material.dart';
import '../../../Colors/colors.dart';
import '../../../Reusables/UIText.dart';


class Senderchat extends StatelessWidget {

  final String message;

  const Senderchat({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        width: 268,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UiText(text: "8:11 pm", textColor: AppColors.lightTxt, fontSize: 12, fontWeight: FontWeight.w400),
            SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryYellowColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(15),
                    child: UiText(text: message,
                        textColor: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(width: 10,),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/girlAvater.png"),
                  radius: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
