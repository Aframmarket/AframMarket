import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/profileCards.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {


    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              color: Colors.transparent,
              width: screenWeight,
              height: screenHeight * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.lightGreyBg,
                        ),
                        padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            UiProfileCard(
                                cardTitle: "Personal Info",
                                iconImage: AssetImage("assets/profileIcon.png"),
                                onPressed: (){}, arrow: true,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            UiProfileCard(
                                cardTitle: "Help Centre",
                                iconImage: AssetImage("assets/questionMark.png"),
                                onPressed: (){}, arrow: true,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.lightGreyBg,
                        ),
                        padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            UiProfileCard(
                                cardTitle: "Withdrawal",
                                iconImage: AssetImage("assets/withdraw.png"),
                                onPressed: (){}, arrow: true,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            UiProfileCard(
                                cardTitle: "Completed Deliveries",
                                iconImage: AssetImage("assets/deliveryTruck.png"),
                                onPressed: (){}, arrow: false,
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.lightGreyBg,
                        ),
                        padding: EdgeInsets.all(14),
                        child: Column(
                          children: [
                            UiProfileCard(
                              cardTitle: "Address",
                              iconImage: AssetImage("assets/map.png"),
                              onPressed: (){}, arrow: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 80,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: screenWeight,
              height: screenHeight * 0.33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
                color: AppColors.primaryGreenColor,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  UiText(
                      text: "My Profile",
                      textColor: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  UiText(
                      text: "Available Balance",
                      textColor: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UiText(
                      text: "#500.00",
                      textColor: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                      onPressed: (){},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(width: 2, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: UiText(
                          text: "Withdraw",
                          textColor: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
