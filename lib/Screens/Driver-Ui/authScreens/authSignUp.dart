import 'package:afram_project/Screens/Driver-Ui/authScreens/authSignUp2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Colors/colors.dart';
import '../../Reusables/largeButton.dart';

class AuthSignUpScreen extends StatefulWidget {
  const AuthSignUpScreen({super.key});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight * 0.15,
          ),
          Text(
            "Let’s get started",
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
            "Please sign up to get started",
            style: GoogleFonts.sen(
              color: Colors.white,
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: screenHeight * 0.1,
          ),
          //the login panel
          Expanded(
            flex: 2,
            child: Container(
              width: screenWeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Form(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name",
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
                                        hintText: "John Doe",
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
                                      "ID Type",
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
                                            borderRadius: BorderRadius.circular(15)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: AppColors.primaryGreenColor,
                                              style: BorderStyle.solid,
                                              width: 1.5,
                                            ),
                                            borderRadius: BorderRadius.circular(15)),
                                        hintText: "International Passport",
                                        filled: true,
                                        fillColor: AppColors.softWhite,
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 15),
                                        hintStyle: TextStyle(
                                            color: Colors.grey[600], fontSize: 14.0),
                                        suffixIcon: Icon(
                                          Icons.keyboard_arrow_down_outlined,
                                          color: AppColors.softIconColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
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
                                        hintText: "E.g Atlanta Georgia Antal north",
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
                                      "Email",
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
                                        hintText: "example@gmail.com",
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
                                      "Driver’s license",
                                      style: GoogleFonts.sen(
                                        color: Colors.black,
                                        textStyle:
                                        Theme.of(context).textTheme.displayLarge,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: screenWeight,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: AppColors.primaryGreenColor,
                                          width: 1,
                                        )
                                      ),
                                      child: Image(

                                          image: AssetImage("assets/document-upload.png")
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: LargeBtn(
                                    btnText: "Next",
                                    btnColor: AppColors.primaryYellowColor,
                                    onTap: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => const Authsignup2()),
                                      );
                                    },
                                    btnTextColor: Colors.white
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
