import 'package:flutter/material.dart';
import '../Colors/colors.dart';
import 'UIText.dart';

class UiProfileCard extends StatefulWidget {
  final String cardTitle;
  final AssetImage iconImage;
  final VoidCallback onPressed;
  final bool arrow;

  const UiProfileCard(
      {super.key,
      required this.cardTitle,
      required this.iconImage,
      required this.onPressed,
        required this.arrow});

  @override
  State<UiProfileCard> createState() => _UiProfileCardState();
}

class _UiProfileCardState extends State<UiProfileCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Image(
                      image: widget.iconImage,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  UiText(
                      text: widget.cardTitle,
                      textColor: AppColors.darkTxt5,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ],
              ),
            ),
            widget.arrow ? Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.iconColorDark,
              size: 15,
            ) : UiText(
                text: "29K",
                textColor: AppColors.softTxt2,
                fontSize: 17,
                fontWeight: FontWeight.w700
            )
          ],
        ),
      ),
    );
  }
}
