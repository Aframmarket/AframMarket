import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LargeBtn extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final Color btnTextColor;
  final VoidCallback? onTap;

  const LargeBtn({
    super.key,
    required this.btnText,
    required this.btnColor,
    required this.onTap,
    required this.btnTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: btnColor,
            borderRadius: BorderRadius.circular(10)),
        child: TextButton(
            onPressed: onTap,
            child: Text(
              btnText,
              style: GoogleFonts.sen(
                color: btnTextColor,
                textStyle:
                Theme.of(context).textTheme.displayLarge,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
        )
    );
  }
}
