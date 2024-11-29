import 'package:flutter/material.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';
import '../../Reusables/customAccordian.dart';

class DeliverProfileScreen extends StatefulWidget {
  const DeliverProfileScreen({super.key});

  @override
  State<DeliverProfileScreen> createState() => _DeliverProfileScreenState();
}

class _DeliverProfileScreenState extends State<DeliverProfileScreen> {
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
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  UiText(
                      text: "Sellers",
                      textColor: AppColors.darkTxt3,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  SizedBox()
                ],
              ),
            ),
          ),
          Center(
              child: UiText(
                  text: "Scheduled delivery",
                  textColor: AppColors.darkTxt3,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.softWhite,
                  hintText: "Search location",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10),),
                  prefixIcon: ImageIcon(AssetImage("assets/search_icon.png",))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UiText(text: 'Top Questions', textColor: AppColors.darkTxt, fontSize: 17, fontWeight: FontWeight.w700,),
                  UiText(text: 'View all', textColor: AppColors.greyTxt, fontSize: 14, fontWeight: FontWeight.w400,)
                ],
              ),
            ),
          ),
          Customaccordian(heading: 'How to create a account?', body: "Open the Aframarket app to get started and follow the steps. Aframarket doesn't charge a fee to create or maintain your Aframaket account."),
          Customaccordian(heading: 'How to add a payment method by this app?', body: "Open the Aframarket app to get started and follow the steps. Aframarket doesn't charge a fee to create or maintain your Aframaket account."),
          Customaccordian(heading: 'What Time Does The Market Open?', body: "Open the Aframarket app to get started and follow the steps. Aframarket doesn't charge a fee to create or maintain your Aframaket account."),
          Customaccordian(heading: 'Is The Market Open On Weekends?', body: "Open the Aframarket app to get started and follow the steps. Aframarket doesn't charge a fee to create or maintain your Aframaket account.")
        ],
      ),
    );;
  }
}
