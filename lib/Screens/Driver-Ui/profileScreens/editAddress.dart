import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';
import '../../Reusables/largeButton.dart';

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: Stack(
          children: [
            SizedBox(child: Image(fit: BoxFit.contain, image: AssetImage("assets/map-bg.png"))),
            Positioned(
              top: 20,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: AppColors.darkTxt4
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
        bottomSheet: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            height: screenHeight * 0.65,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText(text: "ADDRESS", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                      SizedBox(height: 5,),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.softWhite,
                          hintStyle: TextStyle(
                              color: AppColors.lightTxt, fontSize: 14, fontWeight: FontWeight.w400
                          ),
                          hintText: "Write somethings",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),),
                          prefixIcon: Icon(Icons.location_on, size: 25, color: AppColors.textRed,),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiText(text: "STREET", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                            SizedBox(height: 5,),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.softWhite,
                                hintStyle: TextStyle(
                                    color: AppColors.lightTxt, fontSize: 14, fontWeight: FontWeight.w400
                                ),
                                hintText: "enter street name",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UiText(text: "POST CODE", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                            SizedBox(height: 5,),
                            TextFormField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.softWhite,
                                hintStyle: TextStyle(
                                    color: AppColors.lightTxt, fontSize: 14, fontWeight: FontWeight.w400
                                ),
                                hintText: "enter post code",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(10),),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText(text: "APARTMENT", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                      SizedBox(height: 5,),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.softWhite,
                          hintStyle: TextStyle(
                              color: AppColors.lightTxt, fontSize: 14, fontWeight: FontWeight.w400
                          ),
                          hintText: "enter apartment number",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiText(text: "LABEL AS", textColor: AppColors.darkTxt4, fontSize: 14, fontWeight: FontWeight.w400),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryYellowColor,
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Home",
                                      style: GoogleFonts.sen(
                                        color: AppColors.darkTxt4,
                                        textStyle:
                                        Theme.of(context).textTheme.displayLarge,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                )
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: AppColors.softWhite,
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Office",
                                      style: GoogleFonts.sen(
                                        color: AppColors.darkTxt4,
                                        textStyle:
                                        Theme.of(context).textTheme.displayLarge,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                )
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            flex: 1,
                            child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                    color: AppColors.softWhite,
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextButton(
                                    onPressed: (){},
                                    child: Text(
                                      "Others",
                                      style: GoogleFonts.sen(
                                        color: AppColors.darkTxt4,
                                        textStyle:
                                        Theme.of(context).textTheme.displayLarge,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                )
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LargeBtn(
                          btnText: "Save address",
                          btnColor: AppColors.primaryYellowColor,
                          onTap: (){
                          },
                          btnTextColor: Colors.white
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
