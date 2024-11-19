import 'package:afram_project/Screens/Driver-Ui/profileScreens/editProfile.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                  backgroundImage: AssetImage("assets/imgProfile.jpeg"),
                  radius: 40,
                ),
                SizedBox(width: 10,),
                SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText(text: "Mark Wallburg", textColor: AppColors.darkTxt4, fontSize: 20, fontWeight: FontWeight.w700),
                      UiText(text: "markwallburg@gmail.com", textColor: AppColors.hintTextColor, fontSize: 14, fontWeight: FontWeight.w400),
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
                      Text("Nnamdi Sarah", style: GoogleFonts.inter(
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
                      Text("hello@halallab.com", style: GoogleFonts.inter(
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
                      Text("408-841-0926", style: GoogleFonts.inter(
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
                    MaterialPageRoute(builder: (context) => EditProfileScreen()),
                  );
                },
                btnTextColor: Colors.white),
          ),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}
