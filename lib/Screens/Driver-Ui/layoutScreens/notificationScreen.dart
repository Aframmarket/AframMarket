import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Colors/colors.dart';
import '../../Reusables/UIText.dart';
import '../provider/openDelivery_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch orders when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).fetchOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    // final orderProvider = Provider.of<OrderProvider>(context);
    return Consumer<OrderProvider>(builder: (context, orderProvider, child) {
      return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                          text: "Notifications",
                          textColor: AppColors.darkTxt3,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                      ImageIcon(
                        AssetImage("assets/set.png"),
                      )
                    ],
                  ),
                ),
              ),
              orderProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : orderProvider.errorMessage != null
                      ? Center(child: Text(orderProvider.errorMessage!))
                      : orderProvider.orders
                              .isEmpty // Check if there are no orders left
                          ? Center(
                              child: Text(
                                  'No new notifications')) // Display message if no orders
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: orderProvider.orders.length,
                              itemBuilder: (context, index) {
                                final order = orderProvider.orders[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1.5,
                                                style: BorderStyle.solid,
                                                color:
                                                    AppColors.borderColor2))),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            fit: StackFit.loose,
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: AssetImage(
                                                    "assets/profile_placeHolder.png"),
                                                radius: 30,
                                              ),
                                              Container(
                                                width: 12,
                                                height: 12,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    color:
                                                        AppColors.activeGreen,
                                                    border: Border.all(
                                                        width: 2,
                                                        style:
                                                            BorderStyle.solid,
                                                        color: AppColors
                                                            .primaryYellowColor)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(TextSpan(
                                                    text: "Order from ",
                                                    style: GoogleFonts.sen(
                                                      color: AppColors.greyTxt,
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .displayLarge,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    children: [
                                                      TextSpan(
                                                        text:
                                                            "${order.firstname} ${order.lastname}",
                                                        style: GoogleFonts.sen(
                                                          color: AppColors
                                                              .darkTxt6,
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayLarge,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      )
                                                    ])),
                                                Text("Order Id: ${order.id}"),
                                                Text(
                                                    "Shipping address: ${order.shippingAddress}"),
                                                Text(
                                                    "Total: \$${order.grandTotal}"),
                                                Text(
                                                    'Order Date: ${order.orderDate}'),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    order.status ==
                                                            1 // If order is accepted
                                                        ? Text('Accepted',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .green))
                                                        : Row(
                                                            children: [
                                                              ElevatedButton(
                                                                onPressed:
                                                                    () async {
                                                                  await orderProvider
                                                                      .acceptOrder(
                                                                          order
                                                                              .userId,
                                                                          order
                                                                              .id,
                                                                          index);
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                    elevation:
                                                                        0,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10)),
                                                                    backgroundColor:
                                                                        AppColors
                                                                            .lightGreen,
                                                                    textStyle: const TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                                child: Text(
                                                                  'Accept',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 20),
                                                              // Add some space between the buttons
                                                              ElevatedButton(
                                                                onPressed: () {
                                                                  orderProvider
                                                                      .declineOrder(
                                                                          index);
                                                                },
                                                                style: ElevatedButton.styleFrom(
                                                                    elevation:
                                                                        0,
                                                                    shape: RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        side: BorderSide(
                                                                            color: AppColors
                                                                                .greyTxt2)),
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    textStyle: const TextStyle(
                                                                        color: Colors
                                                                            .white)),
                                                                child: Text(
                                                                  'Cancel',
                                                                  style: TextStyle(
                                                                      color: AppColors
                                                                          .greyTxt),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
            ],
          ),
        ),
      );
    });
  }
}
