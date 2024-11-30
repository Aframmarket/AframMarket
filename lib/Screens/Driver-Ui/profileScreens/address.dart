
import 'package:afram_project/Screens/Colors/colors.dart';
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
            child: Container(
                color: Colors.pink,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      color: Colors.green,
                    ),
                    SizedBox(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text("Label"),
                              Row(
                                children: [
                                  Icon(Icons.edit),
                                  Icon(Icons.delete)
                                ],
                              )
                            ],
                          ),
                          Text("Simple address for location of the", softWrap: true,),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}
