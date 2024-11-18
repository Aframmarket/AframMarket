import "package:afram_project/Screens/Colors/colors.dart";
import "package:afram_project/Screens/Reusables/largeButton.dart";
import "package:afram_project/Screens/Reusables/success.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../../Reusables/UIText.dart";

class WithdrawScreen extends StatefulWidget {
  const WithdrawScreen({super.key});

  @override
  State<WithdrawScreen> createState() => _WithdrawScreenState();
}

class _WithdrawScreenState extends State<WithdrawScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
                      text: "Withdraw",
                      textColor: AppColors.darkTxt3,
                      fontSize: 17,
                      fontWeight: FontWeight.w400
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  TextFormField(
                    cursorColor: AppColors.iconGrey,
                    decoration: InputDecoration(
                      labelText: "User Id",
                      labelStyle: TextStyle(
                        color: AppColors.iconGrey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.iconGrey,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    obscureText: true,
                    cursorColor: AppColors.greyTxt3,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: AppColors.greyTxt3,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyTxt3,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    cursorColor: AppColors.greyTxt3,
                    decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle: TextStyle(
                        color: AppColors.greyTxt3,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyTxt3,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  UiText(
                      text: "Commission is not charged by the bank",
                      textColor: AppColors.greyTxt3,
                      fontSize: 13, fontWeight: FontWeight.w400
                  ),
                  Spacer(),
                  LargeBtn(
                      btnText: "Withdraw", btnColor: AppColors.primaryYellowColor, onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
                  }, btnTextColor: Colors.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
