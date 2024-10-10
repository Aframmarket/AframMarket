import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/forgotPassword.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  String _selectedOption = 'Email'; // Initial selected option
  final List<String> _signupOptions = ['Email', 'Phone', 'Google'];

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
              height: screenHeight * 0.15,
            ),
            Text(
              "Log In",
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
              "Please sign in to your existing account",
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
                                    hintText: "mail@example.com",
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
                                  "Password",
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
                                    hintText: "***************",
                                    filled: true,
                                    fillColor: AppColors.softWhite,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 15),
                                    hintStyle: TextStyle(
                                        color: Colors.grey[600], fontSize: 14.0),
                                    suffixIcon: Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: AppColors.softIconColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                          value: false,
                                          onChanged: (bool) {},
                                          materialTapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        Text(
                                          'Remember me',
                                          style: GoogleFonts.sen(
                                            color: Colors.black,
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                                        );
                                      },
                                      child: Text(
                                        "Forgot Password",
                                        style: GoogleFonts.sen(
                                          color: AppColors.primaryYellowColor,
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                LargeBtn(
                                    btnText: "Log In",
                                    btnColor: AppColors.primaryYellowColor,
                                    onTap: () {},
                                    btnTextColor: Colors.white),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don’t have an account?", style: GoogleFonts.sen(
                                      color: Colors.black,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.of(context).pushNamed("/signUpScreen");
                                      },
                                      child: Text("Sign Up", style: GoogleFonts.sen(
                                        color: AppColors.primaryYellowColor,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayLarge,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Or", style: GoogleFonts.sen(
                                      color: Colors.black,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displayLarge,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(20),
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            color: AppColors.softWhite
                                          ),
                                          child: Image(image: AssetImage("assets/googleIcon.png"))
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Container(
                                            padding: EdgeInsets.all(20),
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Colors.black
                                            ),
                                            child: Image(image: AssetImage("assets/appleIcon.png"))
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          )
                        ],
                      )
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
