import 'dart:io';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';
import '../HiveModels/user.dart';
import '../Services/custom_cache_manager.dart';
import '../provider/userProvider.dart';

class EditProfileScreen extends StatefulWidget {
  final String firstname;
  final String lastname;
  final String emailAddress;
  final String phoneNumber;

  const EditProfileScreen(
      {super.key,
      required this.firstname,
      required this.lastname,
      required this.emailAddress,
      required this.phoneNumber});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  @override
  void initState() {
    super.initState();
    // UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    // User? user = userProvider.user;
    _firstNameController = TextEditingController(text: widget.firstname);
    _lastNameController = TextEditingController(text: widget.lastname);
    _emailController = TextEditingController(text: widget.emailAddress);
    _phoneNumberController = TextEditingController(text: widget.phoneNumber);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<File> getCachedProfilePicture(String? imagePath) async {
    if (imagePath == null) {
      throw Exception('No profile picture path provided.');
    }
    File imageFile = File(imagePath);
    if (await imageFile.exists()) {
      // Use cache manager to get the file
      final cachedFile = await ProfilePictureCacheManager.instance.getSingleFile('file://${imageFile.path}');
      return cachedFile;
    } else {
      throw Exception('Profile picture not found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // initializing the provider

    UserProvider userProvider = Provider.of<UserProvider>(context);
    User user = userProvider.user!;
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: userProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.lightGreyBg2),
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          UiText(
                              text: "Edit Profile",
                              textColor: AppColors.darkTxt3,
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Stack(
                      fit: StackFit.loose,
                      children: [
                        FutureBuilder<File>(
                            future: getCachedProfilePicture(user.profilePicturePath),
                            builder: (context, snapshot){
                          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                            return CircleAvatar(
                              radius: 45,
                              backgroundImage: FileImage(snapshot.data!),
                            );
                          }
                          else{
                             return CircleAvatar(
                              backgroundImage:
                              user.profilePicturePath != null ? FileImage(File(user.profilePicturePath!)) :
                              AssetImage('assets/profile_placeHolder.png') as ImageProvider,
                              radius: 45,
                            );
                          }
                            }),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: GestureDetector(
                            onTap: () async{
                              await userProvider.updateProfilePicture();
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryYellowColor,
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 1.5,
                                      style: BorderStyle.solid)),
                              child: Image(
                                  image: AssetImage("assets/camera-icon.png")),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiText(
                                    text: "First Name",
                                    textColor: AppColors.darkTxt5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _firstNameController,
                                  cursorColor: AppColors.primaryGreenColor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.softWhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiText(
                                    text: "Last Name",
                                    textColor: AppColors.darkTxt5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _lastNameController,
                                  cursorColor: AppColors.primaryGreenColor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.softWhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiText(
                                    text: "Email",
                                    textColor: AppColors.darkTxt5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  cursorColor: AppColors.primaryGreenColor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.softWhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiText(
                                    text: "Phone Number",
                                    textColor: AppColors.darkTxt5,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneNumberController,
                                  cursorColor: AppColors.primaryGreenColor,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: AppColors.softWhite,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: LargeBtn(
                        btnText: "Save",
                        btnColor: AppColors.primaryYellowColor,
                        onTap: () {
                          userProvider.updateUserProfile(
                              firstname: _firstNameController.text,
                              lastname: _lastNameController.text,
                              email: _emailController.text,
                              phoneNumber: _phoneNumberController.text);
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.white,
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: UiText(
                                            text: "Ok",
                                            textColor: AppColors.darkTxt5,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                    contentPadding: EdgeInsets.all(10),
                                    content: Builder(builder: (context) {
                                      return Container(
                                        width: 300,
                                        height: 150,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            CircleAvatar(
                                              backgroundColor: Colors.white,
                                              backgroundImage: AssetImage(
                                                  "assets/success.png"),
                                              radius: 30,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            UiText(
                                                text: "Saved",
                                                textColor: AppColors.darkTxt5,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            UiText(
                                                text:
                                                    "You’ve successfully updated your details",
                                                textColor: AppColors.darkTxt5,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ],
                                        ),
                                      );
                                    }),
                                  ));
                        },
                        btnTextColor: Colors.white),
                  ),
                  if (userProvider.errorMessage != null)
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        userProvider.errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
    );
  }
}
