import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.maxFinite,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image(
                      image: AssetImage("assets/yellow-tick.png")
                  ),
                ),
                SizedBox(height: 10,),
                UiText(text: "#100", textColor: AppColors.greyTxt3, fontSize: 30, fontWeight: FontWeight.w800),
                SizedBox(height: 10,),
                UiText(text: "Withdraw Successful", textColor: AppColors.darkTxt5, fontSize: 22, fontWeight: FontWeight.w400),
                SizedBox(height: 10,),
                Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.primaryYellowColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: (){},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Download Receipt",
                              style: GoogleFonts.sen(
                                color: Colors.white,
                                textStyle:
                                Theme.of(context).textTheme.displayLarge,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Image(image: AssetImage("assets/Receipt.png"))
                          ],
                        )
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
