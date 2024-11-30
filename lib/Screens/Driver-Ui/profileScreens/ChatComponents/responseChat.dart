import 'package:flutter/material.dart';
import '../../../Colors/colors.dart';
import '../../../Reusables/UIText.dart';

class ResponseChat extends StatelessWidget {

  final String message;

  const ResponseChat({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            UiText(text: "8:11 pm", textColor: AppColors.lightTxt, fontSize: 12, fontWeight: FontWeight.w400),
            SizedBox(height: 5,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/profile_placeHolder.png"),
                  radius: 25,
                ),
                SizedBox(width: 10,),
                Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.softWhite,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    padding: EdgeInsets.all(15),
                    child: UiText(text: message,
                        textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
