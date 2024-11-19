import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';

import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/imgProfile.jpeg"),
                    radius: 50,
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
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
                      child: Image(image: AssetImage("assets/camera-icon.png")),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UiText(
                      text: "Full Name",
                      textColor: AppColors.darkTxt5,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: AppColors.primaryGreenColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.softWhite,
                      hintText: "Siri Senju",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
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
                    cursorColor: AppColors.primaryGreenColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.softWhite,
                      hintText: "example@gmail.com",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
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
                    cursorColor: AppColors.primaryGreenColor,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.softWhite,
                      hintText: "090 2070 5384",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
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
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          backgroundColor: Colors.white,
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: UiText(text: "Ok", textColor: AppColors.darkTxt5, fontSize: 14, fontWeight: FontWeight.w400),)
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
                                    backgroundImage: AssetImage("assets/success.png"),
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  UiText(text: "Saved", textColor: AppColors.darkTxt5, fontSize: 20, fontWeight: FontWeight.w600),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  UiText(text: "You’ve successfully updated your details", textColor: AppColors.darkTxt5, fontSize: 14, fontWeight: FontWeight.w400),
                                ],
                              ),
                            );
                          }),
                        ));
                  },
                  btnTextColor: Colors.white),
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
