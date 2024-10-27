import 'package:afram_project/Screens/Driver-Ui/Models/driverUserModel.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/locationScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/otpScreen.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../../Reusables/largeButton.dart';
import '../provider/driver_signup_provider.dart';
import '../provider/verification_provider.dart';

class AuthSignUp2 extends StatefulWidget {
  final String? email;
  final String? firstname;
  final String? lastname;

  const AuthSignUp2({super.key, this.email, this.firstname, this.lastname});

  @override
  State<AuthSignUp2> createState() => _AuthSignUp2State();
}

class _AuthSignUp2State extends State<AuthSignUp2> {
  final _formKey = GlobalKey<FormState>();

  //show password
  bool showPassword = false;

  // Controllers for form fields
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize email controller with the passed email
    _emailController = TextEditingController(text: widget.email);
    _firstNameController = TextEditingController(text: widget.firstname);
    _lastNameController = TextEditingController(text: widget.lastname);
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  //to toggle password visibility
  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // Create a DriverSignUpUser object
      DriverSignUpModel user = DriverSignUpModel(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        repeatPassword: _repeatPasswordController.text.trim(),
        // state is defaulted to 20
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
                        padding: EdgeInsets.only(top: 5),
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
                                      CustomTextField(
                                        controllerText: _firstNameController,
                                        hintText: "John",
                                        validationMessage: "",
                                        fieldName: "First Name",
                                        showIcon: false,
                                        readOnly: true,
                                      ),
                                      CustomTextField(
                                        controllerText: _lastNameController,
                                        hintText: "Doe",
                                        validationMessage: "",
                                        fieldName: "Last Name",
                                        showIcon: false,
                                        readOnly: true,
                                      ),
                                      CustomTextField(
                                        controllerText: _emailController,
                                        hintText: "example@gmail.com",
                                        validationMessage: "",
                                        fieldName: "Email Address",
                                        showIcon: false,
                                        readOnly: true,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
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
                                                    vertical: 20,
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
                                        padding: const EdgeInsets.all(15.0),
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
                                            SizedBox(height: 10),
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
                                //         MaterialPageRoute(builder: (context) => const OtpVerificationScreen(email: "amrohore4real@gmail.com")),
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
