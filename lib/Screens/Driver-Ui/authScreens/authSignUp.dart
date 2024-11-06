import 'dart:convert';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authSignUp1.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/locationScreen.dart';
import 'package:afram_project/Screens/Reusables/customEmailField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../../Reusables/CustomDropDown.dart';
import '../../Reusables/customTextField.dart';
import '../../Reusables/largeButton.dart';
import '../Models/driverModel.dart';
import '../provider/signup_provider.dart';

class AuthSignUpScreen extends StatefulWidget {
  final String userId;
  final String email;

  const AuthSignUpScreen(
      {super.key, required this.userId, required this.email});

  @override
  State<AuthSignUpScreen> createState() => _AuthSignUpScreenState();
}

class _AuthSignUpScreenState extends State<AuthSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  List<dynamic> states = [];
  List<String> cities = [];

  // Controllers for form fields
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _businessNameController = TextEditingController();
  final TextEditingController _businessAddressController =
      TextEditingController();
  final TextEditingController _zipcodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  late TextEditingController _emailController;
  late TextEditingController _userIdController;

  @override
  void initState() {
    super.initState();
    loadJsonData();
    _userIdController = TextEditingController(text: widget.userId);
    _emailController = TextEditingController(text: widget.email);
  }

  Future<void> loadJsonData() async {
    // Load the JSON data from the file
    final String response =
        await rootBundle.loadString('assets/JSON/statesAndCities.json');
    final data = jsonDecode(response);

    setState(() {
      states = data['states'];
    });
  }

  void fetchCities(String stateName) {
    setState(() {
      cities = states
          .firstWhere((state) => state['name'] == stateName)['cities']
          .cast<String>();
      _cityController
          .clear(); // Clear the city controller when changing the state
    });
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      // Create a User object
      DriverModel user = DriverModel(
        firstname: _firstNameController.text.trim(),
        lastname: _lastNameController.text.trim(),
        businessname: _businessNameController.text.trim(),
        businessaddress: _businessAddressController.text.trim(),
        zipcode: _zipcodeController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        vehicleType: selectedVehicle,
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        userid: _userIdController.text.trim(),
      );

      // Call the signUp method from the provider
      bool success = await Provider.of<SignUpProvider>(context, listen: false)
          .signUp(user);

      if (success) {
        // Show success message or navigate to another screen
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up successful!')),
        );
        //navigate to auth2 with the details needed
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AccessLocationScreen()));
      } else {
        // Show error message
        String? error =
            Provider.of<SignUpProvider>(context, listen: false).errorMessage;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? 'Sign up failed')),
        );
      }
    }
  }

  String? selectedVehicle;
  final List<String> vehicleTypes = ["Truck", "Bus", "Bike"];

  @override
  void dispose() {
    // Dispose controllers when not needed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _businessNameController.dispose();
    _businessAddressController.dispose();
    _zipcodeController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _vehicleTypeController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    final signUpProvider = Provider.of<SignUpProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryGreenColor,
      body: signUpProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomTextField(
                                    controllerText: _firstNameController,
                                    hintText: 'John',
                                    validationMessage:
                                        'First name cannot be empty',
                                    fieldName: 'First Name',
                                    showIcon: false,
                                    readOnly: false,
                                  ),
                                  CustomTextField(
                                    controllerText: _lastNameController,
                                    hintText: 'Doe',
                                    validationMessage:
                                        'Last name cannot be empty',
                                    fieldName: 'Last Name',
                                    showIcon: false,
                                    readOnly: false,
                                  ),
                                  CustomTextField(
                                    controllerText: _businessNameController,
                                    hintText: 'Business name',
                                    validationMessage:
                                        'Business name cannot be empty',
                                    fieldName: 'Business Name',
                                    showIcon: false,
                                    readOnly: false,
                                  ),
                                  CustomTextField(
                                    controllerText: _businessAddressController,
                                    hintText: 'Business address',
                                    validationMessage:
                                        'Business address cannot be empty',
                                    fieldName: 'Business Address',
                                    showIcon: false,
                                    readOnly: false,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
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
                                          items: states
                                              .map((state) =>
                                          state['name'] as String)
                                              .toList(),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _stateController.text = newValue;
                                              fetchCities(
                                                  newValue); // Fetch cities for the selected state
                                            });
                                          },
                                          controller: _stateController,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "City",
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
                                          hintText: 'Select City',
                                          items: cities,
                                          onChanged: (newValue) {
                                            setState(() {
                                              _cityController.text =
                                                  newValue; // Update the controller
                                            });
                                          },
                                          controller: _cityController,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Zipcode
                                  CustomTextField(
                                    controllerText: _zipcodeController,
                                    hintText: 'Zipcode',
                                    validationMessage:
                                    'Zipcode cannot be empty',
                                    fieldName: 'Zip code',
                                    showIcon: false,
                                    readOnly: false,
                                  ),
                                  // Vehicle Type
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Vehicle",
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
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.softWhite,
                                              border: Border.all(
                                                color: AppColors.primaryGreenColor,
                                                style: BorderStyle.solid,
                                                width: 1.5,
                                              ),
                                              borderRadius: BorderRadius.circular(15)
                                          ),
                                          child: DropdownButton<String>(
                                            padding: EdgeInsets.all(8),
                                            dropdownColor: Colors.white,
                                            underline: SizedBox(),
                                            hint: Text('Select vehicle type', style: GoogleFonts.sen(
                                              color: AppColors.hintTextColor,
                                              textStyle: Theme.of(context).textTheme.displayLarge,
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                            ),),
                                            isExpanded: true,
                                            value: selectedVehicle,
                                            onChanged: (String? newValue) {
                                              setState(() {
                                                selectedVehicle = newValue;
                                              });
                                            },
                                            items: vehicleTypes.map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  CustomEmailField(
                                      controllerText: _emailController,
                                      hintText: "Email Address",
                                      validationMessage:
                                          "Enter a valid email address",
                                      fieldName: "Email Address"),
                                  CustomTextField(
                                    controllerText: _phoneController,
                                    hintText: "Phone number",
                                    validationMessage:
                                        "Phone number cannot be empty",
                                    fieldName: "Phone Number",
                                    showIcon: false,
                                    readOnly: false,
                                  ),
                                  CustomTextField(
                                    controllerText: _userIdController,
                                    hintText: "UserId",
                                    validationMessage:
                                        "User id cannot be empty",
                                    fieldName: "User Id",
                                    showIcon: false,
                                    readOnly: true,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: LargeBtn(
                                        btnText: "Get Started",
                                        btnColor: AppColors.primaryYellowColor,
                                        onTap: _submit,
                                        btnTextColor: Colors.white),
                                  ),
                                ],
                              ),
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
