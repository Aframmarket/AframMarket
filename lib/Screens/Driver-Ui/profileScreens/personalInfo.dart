import 'dart:io';
import 'package:afram_project/Screens/Driver-Ui/profileScreens/editProfile.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';
import '../HiveModels/user.dart';
import '../provider/userProvider.dart';

class PersonalInfoScreen extends StatelessWidget {

  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

    //profile picture path
    String? profilePicturePath = userProvider.user?.profilePicturePath;

    if (userProvider.isLoading) {
      // loading indicator while data is being fetched
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    } else if (userProvider.user != null) {
      User user = userProvider.user!;
      return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Column(
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
                            color: AppColors.lightGreyBg2
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    UiText(
                        text: "Personal Info",
                        textColor: AppColors.darkTxt3,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: profilePicturePath != null && File(profilePicturePath).existsSync() ?
                    FileImage(File(profilePicturePath)) : AssetImage('assets/profile_placeHolder.png'),
                    radius: 30,
                  ),
                  SizedBox(width: 10,),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UiText(text: "${user.firstname} ${user.lastname}", textColor: AppColors.darkTxt4, fontSize: 20, fontWeight: FontWeight.w700),
                        UiText(text: user.email, textColor: AppColors.hintTextColor, fontSize: 14, fontWeight: FontWeight.w400),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColors.iconGrey,
                          width: 1.5
                      )
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/profile-icon.png"),
                      radius: 20,
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Full Name", style: GoogleFonts.inter(
                          color: AppColors.black,
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                        SizedBox(
                          height: 8,
                        ),
                        Text("${user.firstname} ${user.lastname}", style: GoogleFonts.inter(
                          color: AppColors.greyTxt2,
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColors.iconGrey,
                          width: 1.5
                      )
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/mail.png"),
                      radius: 20,
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email", style: GoogleFonts.inter(
                          color: AppColors.black,
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                        SizedBox(
                          height: 8,
                        ),
                        Text(user.email, style: GoogleFonts.inter(
                          color: AppColors.greyTxt2,
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColors.iconGrey,
                          width: 1.5
                      )
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/call-icon.png"),
                      radius: 20,
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Phone Number", style: GoogleFonts.inter(
                          color: AppColors.black,
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                        SizedBox(
                          height: 8,
                        ),
                        Text(user.phone, style: GoogleFonts.inter(
                          color: AppColors.greyTxt2,
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
              child: LargeBtn(
                  btnText: "Edit profile",
                  btnColor: AppColors.primaryYellowColor,
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfileScreen(
                        firstname: user.firstname, lastname: user.lastname,
                        emailAddress: user.email, phoneNumber: user.phone,)
                      ),
                    );
                  },
                  btnTextColor: Colors.white),
            ),
            SizedBox(height: 100,)
          ],
        ),
      );
    } else {
      // No user data found
      return Scaffold(
        body: Center(child: Text('No user data found.')),
      );
    }
  }
}
