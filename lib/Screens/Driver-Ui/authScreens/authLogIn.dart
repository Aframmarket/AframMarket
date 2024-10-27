import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authSignUp2.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/forgotPassword.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/homeScreen.dart';
import 'package:afram_project/Screens/Reusables/customEmailField.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:afram_project/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../provider/login_provider.dart';

class AuthLoginScreen extends StatefulWidget {
  const AuthLoginScreen({super.key});

  @override
  State<AuthLoginScreen> createState() => _AuthLoginScreenState();
}

class _AuthLoginScreenState extends State<AuthLoginScreen> {
  //show password
  bool showPassword = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _rememberMe = false; // State variable for checkbox

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials(); // Load saved email and password if available
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //to toggle password visibility
  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  Future<void> _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    if (email != null) {
      _emailController.text = email;
    }
    if (password != null) {
      _passwordController.text = password;
    }
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      bool success = await Provider.of<LoginProvider>(context, listen: false).login(email, password);

      if (success) {
        // Save credentials if "Remember Me" is checked
        if (_rememberMe) {
          _saveCredentials(email, password);
        } else {
          _clearSavedCredentials(); // Clear saved credentials if not checked
        }
        // Navigate to Home Screen upon successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Home()),
        );
      } else {
        String? error = Provider.of<LoginProvider>(context, listen: false).errorMessage;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error ?? 'Login failed')));
      }
    }
  }

  Future<void> _saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

  Future<void> _clearSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    final loginProvider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: loginProvider.isLoading
          ? Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryYellowColor)
            )
      )
          : SizedBox(
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
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
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
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomEmailField(
                                              controllerText: _emailController,
                                              hintText: "example@gmail.com",
                                              validationMessage:
                                                  "Email field cannot be empty",
                                              fieldName: "Email")
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Password",
                                              style: GoogleFonts.sen(
                                                color: Colors.black,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            TextFormField(
                                              controller: _passwordController,
                                              obscureText: !showPassword,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please enter your password';
                                                }
                                                return null;
                                              },
                                              cursorColor:
                                                  AppColors.primaryGreenColor,
                                              style: TextStyle(fontSize: 16.0),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                hintText: "***************",
                                                filled: true,
                                                fillColor: AppColors.softWhite,
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 15),
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 14.0),
                                                suffixIcon: GestureDetector(
                                                  onTap: toggleShowPassword,
                                                  child: showPassword
                                                      ? Icon(
                                                          Icons.visibility,
                                                          color: AppColors
                                                              .softIconColor,
                                                        )
                                                      : Icon(
                                                          Icons.visibility_off,
                                                          color: AppColors
                                                              .softIconColor,
                                                        ),
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
                                                      value: _rememberMe,
                                                      activeColor: AppColors.primaryYellowColor,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          _rememberMe = value!;
                                                        });
                                                      },
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                    ),
                                                    Text(
                                                      'Remember me',
                                                      style: GoogleFonts.sen(
                                                        color: Colors.black,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .displayLarge,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ForgotPasswordScreen()),
                                                    );
                                                  },
                                                  child: Text(
                                                    "Forgot Password",
                                                    style: GoogleFonts.sen(
                                                      color: AppColors
                                                          .primaryYellowColor,
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
                                                btnColor:
                                                    AppColors.primaryYellowColor,
                                                onTap: _submit,
                                                btnTextColor: Colors.white),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Don’t have an account?",
                                                  style: GoogleFonts.sen(
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
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            "/signUpScreen");
                                                  },
                                                  child: Text(
                                                    "Sign Up",
                                                    style: GoogleFonts.sen(
                                                      color: AppColors
                                                          .primaryYellowColor,
                                                      textStyle: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w400,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Or",
                                                  style: GoogleFonts.sen(
                                                    color: Colors.black,
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .displayLarge,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(50),
                                                            color: AppColors
                                                                .softWhite),
                                                        child: Image(
                                                            image: AssetImage(
                                                                "assets/googleIcon.png"))),
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(20),
                                                        height: 60,
                                                        width: 60,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(50),
                                                            color: Colors.black),
                                                        child: Image(
                                                            image: AssetImage(
                                                                "assets/appleIcon.png")
                                                        )
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      // ElevatedButton(
                                      //   // Within the `FirstRoute` widget:
                                      //     onPressed: () {
                                      //       Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(builder: (context) => const AuthSignUp2()),
                                      //       );
                                      //     },
                                      //     child: Text("Navigate")
                                      // ),
                                      SizedBox(
                                        height: 30,
                                      )
                                    ],
                                  )),
                            ],
                          ),
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
