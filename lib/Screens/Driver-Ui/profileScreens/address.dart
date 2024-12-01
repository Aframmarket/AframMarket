import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Driver-Ui/profileScreens/editAddress.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import '../../Reusables/UIText.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.softWhite
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: ImageIcon(AssetImage("assets/home-icon.png"), color: AppColors.homeBlueIcon,),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: UiText(text: "HOME", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                  ImageIcon(AssetImage("assets/edit-icon.png"), color: AppColors.primaryYellowColor,),
                                  SizedBox(width: 5,),
                                  ImageIcon(AssetImage("assets/delete-icon.png"), color: AppColors.primaryYellowColor,)
                                ],
                              )
                            ],
                          ),
                          UiText(text: "2464 Royal Ln. Mesa, New Jersey 45463", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.softWhite
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: ImageIcon(AssetImage("assets/work-place.png"), color: AppColors.workPlaceIcon,),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: UiText(text: "OFFICE", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                  ImageIcon(AssetImage("assets/edit-icon.png"), color: AppColors.primaryYellowColor,),
                                  SizedBox(width: 5,),
                                  ImageIcon(AssetImage("assets/delete-icon.png"), color: AppColors.primaryYellowColor,)
                                ],
                              )
                            ],
                          ),
                          UiText(text: "2464 Royal Ln. Mesa, New Jersey 45463", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: LargeBtn(
                btnText: "Edit address",
                btnColor: AppColors.primaryYellowColor,
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const EditAddressScreen()),
                  );
                },
                btnTextColor: Colors.white
            ),
          ),
          SizedBox(height: 40,)
        ],
      ),
    );
  }
}
