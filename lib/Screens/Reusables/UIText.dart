import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UiText extends StatelessWidget {

  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign? textAlign;

  const UiText({
    super.key,
    required this.text,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: true,
      text,
      style: GoogleFonts.sen(
        color: textColor,
        textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}
