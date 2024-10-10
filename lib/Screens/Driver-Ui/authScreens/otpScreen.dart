import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Colors/colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: SizedBox(
        width: screenWeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.09,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
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
                      color: Colors.white),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              "Verification",
              style: GoogleFonts.sen(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "We have sent a code to your email",
              style: GoogleFonts.sen(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "example@gmail.com",
              style: GoogleFonts.sen(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 0.07,
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: screenWeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Code",
                            style: GoogleFonts.sen(
                              color: Colors.black,
                              textStyle:
                                  Theme.of(context).textTheme.displayLarge,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Form(
                              child: Container(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.softWhite,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    //copy this on change in every box
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                      if (value.isEmpty) {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    onSaved: (pin1) {},
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.softWhite,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    //copy this on change in every box
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                      if (value.isEmpty) {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    onSaved: (pin2) {},
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.softWhite,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                      if (value.isEmpty) {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    onSaved: (pin3) {},
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 68,
                                  width: 64,
                                  child: TextFormField(
                                    //copy this on change in every box
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.softWhite,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppColors.primaryGreenColor,
                                            style: BorderStyle.solid,
                                            width: 1.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    ),
                                    onChanged: (value) {
                                      if (value.length == 1) {
                                        FocusScope.of(context).nextFocus();
                                      }
                                      if (value.isEmpty) {
                                        FocusScope.of(context).previousFocus();
                                      }
                                    },
                                    onSaved: (pin4) {},
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(1),
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                          Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Resend',
                                    style: GoogleFonts.sen(
                                      color: Colors.black,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' in 30sec',
                                    style: GoogleFonts.sen(
                                      color: Colors.black,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          LargeBtn(
                              btnText: "Verify",
                              btnColor: AppColors.primaryYellowColor,
                              onTap: () {},
                              btnTextColor: Colors.white)
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
