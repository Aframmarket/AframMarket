import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildOnboardingScreen extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String imageUrl;

  const BuildOnboardingScreen(
      {super.key,
      required this.heading,
      required this.subHeading,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: screenHeight * 0.6,
            width: screenWidth * 0.9,
            // color: Colors.cyan,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Image(image: AssetImage(imageUrl)),
                      SizedBox(
                        height: 29,
                      ),
                      Text(
                        heading,
                        style: GoogleFonts.sen(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        subHeading,
                        style: GoogleFonts.sen(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
