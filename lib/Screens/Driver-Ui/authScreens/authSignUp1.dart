import 'dart:convert';
import 'package:afram_project/Screens/Driver-Ui/Models/driverUserModel.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/locationScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/otpScreen.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/customEmailField.dart';
import 'package:afram_project/Screens/Reusables/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../../Reusables/CustomDropDown.dart';
import '../../Reusables/largeButton.dart';
import '../provider/driver_signup_provider.dart';
import '../provider/verification_provider.dart';

class AuthSignUp1 extends StatefulWidget {
  const AuthSignUp1({super.key,});

  @override
  State<AuthSignUp1> createState() => _AuthSignUp1State();
}

class _AuthSignUp1State extends State<AuthSignUp1> {
  final _formKey = GlobalKey<FormState>();
  List<dynamic> states = [];

  //show password
  bool showPassword = false;

  // Controllers for form fields
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  //to toggle password visibility
  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  Future<void> loadJsonData() async {
    // Load the JSON data from the file
    final String response = await rootBundle.loadString('assets/JSON/statesAndCities.json');
    final data = jsonDecode(response);

    setState(() {
      states = data['states'];
    });
  }


  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // Create a DriverSignUpUser object
      DriverSignUpModel user = DriverSignUpModel(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        repeatPassword: _repeatPasswordController.text.trim(),
        state: _stateController.text.trim(),
      );

      // Call the signUp method from the provider
      bool success =
          await Provider.of<DriverSignUpProvider>(context, listen: false)
              .signUp(user);

      if (success) {
        // Show success message
        String? successMessage =
            Provider.of<DriverSignUpProvider>(context, listen: false)
                .successMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMessage ?? 'Sign up successful!')),
        );
        // Optionally, navigate to a verification screen where the user enters the code sent to their email
        // Call the verifyCode method from the provider
        // Navigator.push(context, MaterialPageRoute(builder: (_) => VerificationScreen()));
        // Navigate to Verification Screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
                OtpVerificationScreen(email: _emailController.text.trim()),
          ),
        );
      } else {
        // Show error message
        String? error =
            Provider.of<DriverSignUpProvider>(context, listen: false)
                .errorMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? 'Sign up failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final driverSignUpProvider = Provider.of<DriverSignUpProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: driverSignUpProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryYellowColor)))
          : SizedBox(
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
                    "Awesome",
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
                    "Now, let’s create your account",
                    style: GoogleFonts.sen(
                      color: Colors.white,
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
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
                      child: Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: SingleChildScrollView(
                          child: Column(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 15,
                                ),
                                //position for form
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomEmailField(
                                          controllerText: _emailController,
                                          hintText: "example@gmail.com",
                                          validationMessage: "Email field cannot be empty",
                                          fieldName: "Email Address"
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
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
                                                  return 'Please enter password';
                                                }
                                                if (value.length < 6) {
                                                  return 'Password must be at least 6 characters long';
                                                }
                                                return null;
                                              },
                                              cursorColor:
                                              AppColors.primaryGreenColor,
                                              style: TextStyle(fontSize: 16.0),
                                              decoration: InputDecoration(
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
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                hintText: "password",
                                                filled: true,
                                                fillColor: AppColors.softWhite,
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 15,
                                                    horizontal: 15),
                                                hintStyle: TextStyle(
                                                    color: AppColors.softIconColor,
                                                    fontSize: 14.0),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Confirm Password",
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
                                              controller: _repeatPasswordController,
                                              obscureText: !showPassword,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please repeat your password';
                                                }
                                                if (value !=
                                                    _passwordController.text) {
                                                  return 'Passwords do not match';
                                                }
                                                return null;
                                              },
                                              cursorColor:
                                              AppColors.primaryGreenColor,
                                              style: TextStyle(fontSize: 16.0),
                                              decoration: InputDecoration(
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
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: AppColors
                                                          .primaryGreenColor,
                                                      style: BorderStyle.solid,
                                                      width: 1.5,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(15)),
                                                hintText: "confirm password",
                                                filled: true,
                                                fillColor: AppColors.softWhite,
                                                contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 20,
                                                    horizontal: 15),
                                                hintStyle: TextStyle(
                                                    color: Colors.grey[600],
                                                    fontSize: 14.0),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              "State",
                                              style: GoogleFonts.sen(
                                                color: Colors.black,
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CustomDropdownField(
                                              hintText: 'Select State',
                                              items: states.map((state) => state['name'] as String).toList(),
                                              onChanged: (newValue) {
                                                setState(() {
                                                  _stateController.text = newValue;
                                                });
                                              },
                                              controller: _stateController,
                                            ),
                                            SizedBox(height: 20),
                                            UiText(
                                                text:
                                                "The password should be at least 11 characters long with lower case, upper case and numbers",
                                                textColor: AppColors.softIconColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: LargeBtn(
                                            btnText: "Get Started",
                                            btnColor: AppColors.primaryYellowColor,
                                            onTap: _submit,
                                            btnTextColor: Colors.white),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(30.0),
                                        child: UiText(
                                          text:
                                          "By signing up, you’ve agreed to the terms and conditions applied.",
                                          textColor: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // ElevatedButton(
                                //     onPressed: (){
                                //       Navigator.push(
                                //         context,
                                //         MaterialPageRoute(builder: (context) => OtpVerificationScreen(email: _emailController.text.trim())),
                                //       );
                                //     },
                                //     child: Text("Otp screen")),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ]),
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
