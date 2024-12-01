import 'dart:io';
import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Driver-Ui/layoutScreens/MapsViews/startDeliveryMap.dart';
import 'package:afram_project/Screens/Driver-Ui/sideScreens/recentDelivery.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/deliveryCards.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/openDelivery_provider.dart';
import '../provider/userProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch accepted orders when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).fetchAcceptedOrders();
    });
  }

  // to show pending orders
  void showPendingBottomSheet() {
    showModalBottomSheet(
        useSafeArea: true,
        backgroundColor: AppColors.bgWhite,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          final orderProvider = Provider.of<OrderProvider>(context);
          return orderProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : orderProvider.errorMessage != null
                  ? Center(child: Text(orderProvider.errorMessage!))
                  : orderProvider.acceptedOrders
                          .isEmpty // Check if there are no accepted orders
                      ? Center(
                          child: Text(
                              'No new notifications')) // Display message if no accepted orders
                      : ListView.builder(
                          itemCount: orderProvider.acceptedOrders.length,
                          itemBuilder: (context, index) {
                            final order = orderProvider.acceptedOrders[index];
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(15),
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UiText(
                                    text: 'Order ID: #${order.id}',
                                    textColor: AppColors.darkTxt3,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 5),
                                  UiText(
                                    text: 'Order Date: ${order.orderDate}',
                                    textColor: AppColors.darkTxt3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 5),
                                  UiText(
                                    text:
                                        'Shipping Address: ${order.shippingAddress}',
                                    textColor: AppColors.darkTxt3,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  SizedBox(height: 10),
                                  UiText(
                                    text: 'Products:',
                                    textColor: AppColors.darkTxt3,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 10),
                                  ...order.products.map((product) => UiText(
                                        text:
                                            '${product.name} (x${product.quantity}) - \$${product.price * product.quantity}',
                                        textColor: AppColors.darkTxt3,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      )),
                                  SizedBox(height: 10),
                                  UiText(
                                    text: 'Total: \$${order.grandTotal}',
                                    textColor: AppColors.darkTxt3,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      UiText(
                                        text: 'Status Accepted',
                                        textColor: AppColors.textGreen,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      order.deliveryStarted
                                          ? OutlinedButton(
                                              onPressed: () {
                                                // Navigate to view delivery
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        StartDeliverMapScreen(
                                                      destinationAddress:
                                                          order.shippingAddress,
                                                      isViewing: true,
                                                    ),
                                                  ),
                                                );
                                              },
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.textGreen,
                                                side: BorderSide(
                                                    width: 2,
                                                    color: Colors.white),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                              child: UiText(
                                                text: "View Delivery",
                                                textColor: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                          : OutlinedButton(
                                              onPressed: () {
                                                setState(() {
                                                  order.deliveryStarted = true;
                                                });
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            StartDeliverMapScreen(
                                                              destinationAddress:
                                                                  order
                                                                      .shippingAddress,
                                                              isViewing: false,
                                                            )));
                                              },
                                              style: OutlinedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.textGreen,
                                                side: BorderSide(
                                                    width: 2,
                                                    color: Colors.white),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                ),
                                              ),
                                              child: UiText(
                                                  text: "Start Delivery.",
                                                  textColor: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600))
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
        });
  }

  // to show scheduled orders
  void showScheduledBottomSheet() {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
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
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios_new_outlined),
                        ),
                        UiText(
                            text: "07 Scheduled Deliveries",
                            textColor: AppColors.darkTxt3,
                            fontSize: 17,
                            fontWeight: FontWeight.w400),
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
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              SizedBox(
                                height: 3,
                              ),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              SizedBox(
                                height: 3,
                              ),
                              // LargeBtn(
                              //     btnText: "Delivered",
                              //     btnColor: AppColors.lightGreen,
                              //     onTap: (){},
                              //     btnTextColor: Colors.white
                              // )
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: UiText(
                                        text:
                                            "Package will be open for delivery in the next 72hrs",
                                        textColor: AppColors.softTxt2,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Flexible(
                                    child: UiText(
                                        text: "60:56 hours left",
                                        textColor: AppColors.lightGreen,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
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
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              SizedBox(
                                height: 3,
                              ),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              SizedBox(
                                height: 3,
                              ),
                              LargeBtn(
                                  btnText: "Delivered",
                                  btnColor: AppColors.lightGreen,
                                  onTap: () {},
                                  btnTextColor: Colors.white)
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
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UiText(
                                      text: "#Brama Fish",
                                      textColor: AppColors.pendingColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                  UiText(
                                      text: "#65",
                                      textColor: AppColors.darkTxt4,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              UiText(
                                  text: "1KG",
                                  textColor: AppColors.darkTxt4,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                              SizedBox(
                                height: 3,
                              ),
                              UiText(
                                  text: "ID: 32053",
                                  textColor: AppColors.softTxt2,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                              SizedBox(
                                height: 3,
                              ),
                              LargeBtn(
                                  btnText: "Delivered",
                                  btnColor: AppColors.lightGreen,
                                  onTap: () {},
                                  btnTextColor: Colors.white)
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
    final orderProvider = Provider.of<OrderProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);

    //profile picture path
    String? profilePicturePath = userProvider.user?.profilePicturePath;

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
                                  fontWeight: FontWeight.w700),
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
                      backgroundImage: profilePicturePath != null &&
                              File(profilePicturePath).existsSync()
                          ? FileImage(File(profilePicturePath))
                          : AssetImage('assets/profile_placeHolder.png'),
                      radius: 25,
                    ),
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
                    color: AppColors.primaryLightYellowColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWeight / 2,
                      child: UiText(
                          text: "Deliver Groceries Fast and Earn Big",
                          textColor: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Image(image: AssetImage("assets/delivery-bike.png"))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage("assets/chart.png"),
                    fit: BoxFit.cover,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          showPendingBottomSheet();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: UiText(
                                    text: orderProvider.acceptedOrders.length
                                        .toString()
                                        .padLeft(2, '0'),
                                    textColor: AppColors.primaryGreenColor,
                                    fontSize: 52.32,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: UiText(
                                    text: "Pending delivery",
                                    textColor: AppColors.softText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          showScheduledBottomSheet();
                        },
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Flexible(
                                child: UiText(
                                    text: "05",
                                    textColor: AppColors.primaryGreenColor,
                                    fontSize: 52.32,
                                    fontWeight: FontWeight.w700),
                              ),
                              Flexible(
                                child: UiText(
                                    text: "Scheduled Delivery",
                                    textColor: AppColors.softText,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
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
                        fontWeight: FontWeight.w500),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RecentDeliveryScreen()),
                        );
                      },
                      child: UiText(
                          text: "View All",
                          textColor: AppColors.primaryYellowColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
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
                timeDate: "4th July"),
            SizedBox(
              height: 90,
            )
          ],
        ),
      ),
    );
  }
}
