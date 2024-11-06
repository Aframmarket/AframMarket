import 'dart:convert';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authSignUp.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../Models/verificationModel.dart';
import '../provider/verification_provider.dart';
import 'locationScreen.dart';
import 'package:http/http.dart' as http;

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  int _resendCounter = 60;
  bool _isResendEnabled = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Start the countdown for resend button
    _startResendTimer();
  }

  void _startResendTimer() {
    _isResendEnabled = false;
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        if (_resendCounter > 0) {
          _resendCounter--;
          _startResendTimer();
        } else {
          _isResendEnabled = true;
          _resendCounter = 60; // Reset for the next resend
        }
      });
    });
  }

  //
  void _onChange(int index) {
    // Move to the next box if current input is not empty
    if (_controllers[index].text.isNotEmpty && index < 5) {
      FocusScope.of(context).nextFocus();
    }

    // Move to the previous box if backspace is pressed
    if (_controllers[index].text.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  //
  void _verifyCode() {
    String code = _controllers.map((controller) => controller.text).join('');
    print('Verification code entered: $code');
    // Implement verification logic here
  }

  Future<void> resendOtp() async {

    // Send API request to resend OTP
    final response = await http.post(
      Uri.parse('https://aframmarket.com/sandbox/api/account/resend-code'),
      headers: {
        'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
        'Content-Type': 'application/json'
      },
      body: jsonEncode({'email': widget.email}),
    );

    if (response.statusCode == 200) {
      // Assuming the API returns a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('OTP code has been resent to your email')),
      );
      _startResendTimer();
    } else {
      // Show error message from the API response
      final responseBody = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseBody['error'] ?? 'Failed to resend OTP')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers when not needed
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  // void buttFuc(){
  //   final String code = _controllers.map((controller) => controller.text).join('');
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => AuthSignUpScreen(userId: code, email: widget.email,)),
  //   );
  // }

  void _submit() async {
    final String code = _controllers.map((controller) => controller.text).join('');

    if (_formKey.currentState!.validate()) {
      Verification verification = Verification(
        email: widget.email,
        code: _controllers.map((controller) => controller.text).join(''),
      );

      bool success =
          await Provider.of<VerificationProvider>(context, listen: false)
              .verifyCode(verification);

      if (success) {
        String? successMessage =
            Provider.of<VerificationProvider>(context, listen: false)
                .successMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(successMessage ?? 'Verification successful!')),
        );
        // Navigate to the main application screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AuthSignUpScreen(userId: code, email: widget.email,)),
        );
      } else {
        String? error =
            Provider.of<VerificationProvider>(context, listen: false)
                .errorMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? 'Verification failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final verificationProvider = Provider.of<VerificationProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: verificationProvider.isLoading
          ? Center(child: CircularProgressIndicator())
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
                    widget.email,
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
                                  "Enter Code",
                                  style: GoogleFonts.sen(
                                    color: Colors.black,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayLarge,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(6, (index) {
                                        return Expanded(
                                          child: Container(
                                            width: 50,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: TextField(
                                              controller: _controllers[index],
                                              onChanged: (value) {
                                                _onChange(index);
                                              },
                                              obscureText: false,
                                              textAlign: TextAlign.center,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                              ),
                                              // Limit input length to 1 character
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    1),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: _isResendEnabled
                                      ? TextButton(
                                          onPressed: resendOtp,
                                          child: UiText(
                                              text: "Resend",
                                              textColor: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        )
                                      : Text('Resend in $_resendCounter sec'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                LargeBtn(
                                    btnText: "Verify",
                                    btnColor: AppColors.primaryYellowColor,
                                    onTap: _submit,
                                    btnTextColor: Colors.white
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // ElevatedButton(
                                //     onPressed: buttFuc, child: Text("Next screen"))
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
