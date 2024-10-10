import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccessLocationScreen extends StatefulWidget {
  const AccessLocationScreen({super.key});

  @override
  State<AccessLocationScreen> createState() => _AccessLocationScreenState();
}

class _AccessLocationScreenState extends State<AccessLocationScreen> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: screenHeight * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image(
                    image: AssetImage("assets/gpsBg.png")
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                LargeBtn(
                    btnText: "Access location",
                    btnColor: AppColors.primaryYellowColor,
                    onTap: (){
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                    },
                    btnTextColor: Colors.white
                ),
                SizedBox(
                  height: 70
                ),
                Text(
                  "Aframmarket will only access your location while using the app",
                  style: GoogleFonts.sen(
                  color: Colors.black,
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayLarge,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
