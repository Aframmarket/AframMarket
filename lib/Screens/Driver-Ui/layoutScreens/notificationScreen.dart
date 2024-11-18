import 'package:afram_project/Screens/Driver-Ui/sideScreens/deliveryScreen.dart';
import 'package:afram_project/Screens/Driver-Ui/sideScreens/ongoingDeliviries.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    UiText(
                        text: "Notification",
                        textColor: AppColors.darkTxt3,
                        fontSize: 17,
                        fontWeight: FontWeight.w400
                    ),
                    ImageIcon(
                      AssetImage("assets/set.png"),
                    )
                  ],
                ),
              ),
            ),
            //contents of notification screen.
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, style: BorderStyle.solid, color: AppColors.borderColor)
                  )
                ),
                //it has a row and column. row 1 for profile row 2 for the contents tht will contain a column
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/femaleReviewer.jpg"),
                            radius: 30,
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.activeGreen,
                              border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: AppColors.primaryYellowColor
                              )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Olumide Gbenga ",
                                style: GoogleFonts.sen(
                                  color: AppColors.darkTxt6,
                                  textStyle: Theme.of(context).textTheme.displayLarge,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: "has rescheduled this order for later",
                                    style: GoogleFonts.sen(
                                      color: AppColors.greyTxt,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ]
                              )
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            UiText(
                                text: "10 mins ago",
                                textColor: AppColors.greyTxt2,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, style: BorderStyle.solid, color: AppColors.borderColor)
                    )
                ),
                //it has a row and column. row 1 for profile row 2 for the contents tht will contain a column
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/femaleReviewer.jpg"),
                            radius: 30,
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.activeGreen,
                                border: Border.all(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: AppColors.primaryYellowColor
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                                TextSpan(
                                    text: "Order from Olu store to ",
                                    style: GoogleFonts.sen(
                                      color: AppColors.greyTxt,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Olumide Gbenga",
                                        style: GoogleFonts.sen(
                                          color: AppColors.darkTxt6,
                                          textStyle: Theme.of(context).textTheme.displayLarge,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]
                                )
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                    onPressed: (){},
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: AppColors.lightGreen,
                                      side: BorderSide(width: 2, color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text("Accept", style: GoogleFonts.inter(
                                      color: Colors.white,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    )
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                    onPressed: (){},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(width: 2, color: AppColors.borderColor2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text("Cancel", style: GoogleFonts.inter(
                                      color: AppColors.greyTxt,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    )
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            UiText(
                                text: "Today at 9:42 AM",
                                textColor: AppColors.greyTxt2,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, style: BorderStyle.solid, color: AppColors.borderColor)
                    )
                ),
                //it has a row and column. row 1 for profile row 2 for the contents tht will contain a column
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/femaleReviewer.jpg"),
                            radius: 30,
                          ),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: AppColors.activeGreen,
                                border: Border.all(
                                    width: 2,
                                    style: BorderStyle.solid,
                                    color: AppColors.primaryYellowColor
                                )
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                                TextSpan(
                                    text: "Order from Olu store to ",
                                    style: GoogleFonts.sen(
                                      color: AppColors.greyTxt,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Olumide Gbenga",
                                        style: GoogleFonts.sen(
                                          color: AppColors.darkTxt6,
                                          textStyle: Theme.of(context).textTheme.displayLarge,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ]
                                )
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                OutlinedButton(
                                    onPressed: (){},
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: AppColors.lightGreen,
                                      side: BorderSide(width: 2, color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text("Accept", style: GoogleFonts.inter(
                                      color: Colors.white,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    )
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                OutlinedButton(
                                    onPressed: (){},
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(width: 2, color: AppColors.borderColor2),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                    ),
                                    child: Text("Cancel", style: GoogleFonts.inter(
                                      color: AppColors.greyTxt,
                                      textStyle: Theme.of(context).textTheme.displayLarge,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    )
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            UiText(
                                text: "Today at 9:42 AM",
                                textColor: AppColors.greyTxt2,
                                fontSize: 14,
                                fontWeight: FontWeight.w500
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              // Within the `FirstRoute` widget:
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OpenDeliveriesScreen()),
                  );
                },
                child: Text("Navigate")
            ),

            ElevatedButton(
              // Within the `FirstRoute` widget:
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OngoingDeliveryScreen()),
                  );
                },
                child: Text("ongoing deliviries")
            ),
          ],
        ),
      ),
    );
  }
}
