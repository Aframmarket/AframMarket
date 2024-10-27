import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Driver-Ui/authScreens/authLogIn.dart';
import 'package:afram_project/Screens/Driver-Ui/sideScreens/recentDelivery.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/deliveryCards.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/login_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void showPendingBottomSheet(){
    showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
        context: context,
        builder: (BuildContext context){
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                              Icons.arrow_back_ios_new_outlined
                          ),
                        ),
                        UiText(
                            text: "07 Pending Deliveries",
                            textColor: AppColors.darkTxt3,
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              LargeBtn(
                                  btnText: "Pending",
                                  btnColor: AppColors.primaryYellowColor,
                                  onTap: (){},
                                  btnTextColor: Colors.white
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              LargeBtn(
                                  btnText: "Pending",
                                  btnColor: AppColors.primaryYellowColor,
                                  onTap: (){},
                                  btnTextColor: Colors.white
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              LargeBtn(
                                  btnText: "Pending",
                                  btnColor: AppColors.primaryYellowColor,
                                  onTap: (){},
                                  btnTextColor: Colors.white
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              LargeBtn(
                                  btnText: "Pending",
                                  btnColor: AppColors.primaryYellowColor,
                                  onTap: (){},
                                  btnTextColor: Colors.white
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
    });
  }

  void showScheduledBottomSheet(){
    showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context){
          return Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                              Icons.arrow_back_ios_new_outlined
                          ),
                        ),
                        UiText(
                            text: "07 Scheduled Deliveries",
                            textColor: AppColors.darkTxt3,
                            fontSize: 17,
                            fontWeight: FontWeight.w400
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                  fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              // LargeBtn(
                              //     btnText: "Delivered",
                              //     btnColor: AppColors.lightGreen,
                              //     onTap: (){},
                              //     btnTextColor: Colors.white
                              // )
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: UiText(
                                        text: "Package will be open for delivery in the next 72hrs",
                                        textColor: AppColors.softTxt2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                  Flexible(
                                    child: UiText(
                                        text: "60:56 hours left",
                                        textColor: AppColors.lightGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              LargeBtn(
                                  btnText: "Delivered",
                                  btnColor: AppColors.lightGreen,
                                  onTap: (){},
                                  btnTextColor: Colors.white
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/fish.png"),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400
                                  ),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400
                                  )
                                ],
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700
                              ),
                              SizedBox(height: 3,),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                              SizedBox(height: 3,),
                              LargeBtn(
                                  btnText: "Delivered",
                                  btnColor: AppColors.lightGreen,
                                  onTap: (){},
                                  btnTextColor: Colors.white
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {

    final loginProvider = Provider.of<LoginProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await loginProvider.logout(); // Call logout
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => AuthLoginScreen()),
                        ); // Navigate back to login screen
                      },
                      child: Text('Logout'),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(
                              Icons.location_on,
                            size: 50,
                            color: AppColors.primaryYellowColor,
                          ),
                          SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                UiText(
                                    text: "LOCATION",
                                    textColor: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                UiText(
                                  text: 'Benin City, Nigeria',
                                  textColor: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )
                            ],
                          ))
                        ],
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/femaleReviewer.jpg"),
                      radius: 30,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.primaryLightYellowColor
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWeight / 2,
                      child: UiText(
                          text: "Deliver Groceries Fast and Earn Big",
                          textColor: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Image(
                        image: AssetImage("assets/delivery-bike.png")
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                width: double.infinity,
                  child: Image(image: AssetImage("assets/chart.png"),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: (){
                          showPendingBottomSheet();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiText(
                                  text: "07",
                                  textColor: AppColors.primaryGreenColor,
                                  fontSize: 52.32,
                                  fontWeight: FontWeight.w700
                              ),
                              UiText(
                                  text: "Pending delivery",
                                  textColor: AppColors.softText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: (){
                          showScheduledBottomSheet();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiText(
                                  text: "05",
                                  textColor: AppColors.primaryGreenColor,
                                  fontSize: 52.32,
                                  fontWeight: FontWeight.w700
                              ),
                              UiText(
                                  text: "Scheduled Delivery",
                                  textColor: AppColors.softText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UiText(
                        text: "Recent Delivery",
                        textColor: AppColors.darkTxt,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RecentDeliveryScreen()),
                        );
                      },
                      child: UiText(
                          text: "View All",
                          textColor: AppColors.primaryYellowColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
            ),
            DeliveryCards(
                iconImage: AssetImage("assets/foodIcon.png"),
                titleText: "ID:#32053",
                subText: "Protein (1KG) . Olu Store",
                lastText: "Delivered",
                withdrawIcon: AssetImage("assets/recipt.png"),
                timeDate: "4th July"
            ),
            SizedBox(height: 90,)
          ],
        ),
      ),
    );
  }
}
