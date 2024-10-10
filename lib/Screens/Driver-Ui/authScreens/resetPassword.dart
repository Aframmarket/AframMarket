import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Colors/colors.dart';
import '../../Reusables/largeButton.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
              "Reset Password",
              style: GoogleFonts.sen(
                color: Colors.white,
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50,
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
                child: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              //position for form
                              Form(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "New Password",
                                              style: GoogleFonts.sen(
                                                color: Colors.black,
                                                textStyle:
                                                Theme.of(context).textTheme.displayLarge,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              cursorColor: AppColors.primaryGreenColor,
                                              style: TextStyle(fontSize: 16.0),
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors.primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors.primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                hintText: "*******************",
                                                filled: true,
                                                fillColor: AppColors.softWhite,
                                                contentPadding: EdgeInsets.symmetric(
                                                    vertical: 20, horizontal: 15),
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[600], fontSize: 14.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Confirm Password",
                                              style: GoogleFonts.sen(
                                                color: Colors.black,
                                                textStyle:
                                                Theme.of(context).textTheme.displayLarge,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              cursorColor: AppColors.primaryGreenColor,
                                              style: TextStyle(fontSize: 16.0),
                                              decoration: InputDecoration(
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors.primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors.primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius: BorderRadius.circular(15)
                                                ),
                                                hintText: "*******************",
                                                filled: true,
                                                fillColor: AppColors.softWhite,
                                                contentPadding: EdgeInsets.symmetric(
                                                    vertical: 20, horizontal: 15),
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[600], fontSize: 14.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: LargeBtn(
                                            btnText: "Send Code",
                                            btnColor: AppColors.primaryYellowColor,
                                            onTap: (){},
                                            btnTextColor: Colors.white
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ]
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
