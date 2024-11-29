import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Reusables/UIText.dart';
import '../provider/openDelivery_provider.dart';

class OpenDeliveriesScreen extends StatefulWidget {
  const OpenDeliveriesScreen({super.key});

  @override
  _OpenDeliveriesScreenState createState() => _OpenDeliveriesScreenState();
}

class _OpenDeliveriesScreenState extends State<OpenDeliveriesScreen> {
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
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: orderProvider.isLoading
            ? Center(child: CircularProgressIndicator())
            : orderProvider.errorMessage != null
                ? Center(child: Text(orderProvider.errorMessage!))
                : orderProvider
                        .orders.isEmpty // Check if there are no orders left
                    ? Center(
                        child: Text(
                            'No new notifications')) // Display message if no orders
                    : ListView.builder(
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
                                          color: AppColors.borderColor2))),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  BorderRadius.circular(50),
                                              color: AppColors.activeGreen,
                                              border: Border.all(
                                                  width: 2,
                                                  style: BorderStyle.solid,
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
                                                textStyle: Theme.of(context)
                                                    .textTheme
                                                    .displayLarge,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              children: [
                                                TextSpan(
                                                  text:
                                                      "${order.firstname} ${order.lastname}",
                                                  style: GoogleFonts.sen(
                                                    color: AppColors.darkTxt6,
                                                    textStyle: Theme.of(context)
                                                        .textTheme
                                                        .displayLarge,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )
                                              ])),
                                          Text("Order Id: ${order.id}"),
                                          Text(
                                              "Shipping address: ${order.shippingAddress}"),
                                          Text("Total: \$${order.grandTotal}"),
                                          Text(
                                              'Order Date: ${order.orderDate}'),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              order.status ==
                                                      1 // If order is accepted
                                                  ? Text('Accepted',
                                                      style: TextStyle(
                                                          color: Colors.green))
                                                  : Row(
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () async {
                                                            await orderProvider
                                                                .acceptOrder(
                                                                    order
                                                                        .userId,
                                                                    order.id,
                                                                    index);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 0,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              backgroundColor:
                                                                  AppColors
                                                                      .lightGreen,
                                                              textStyle:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                          child: Text(
                                                            'Accept',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        SizedBox(width: 20),
                                                        // Add some space between the buttons
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            orderProvider
                                                                .declineOrder(
                                                                    index);
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                              elevation: 0,
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  side: BorderSide(
                                                                      color: AppColors
                                                                          .greyTxt2)),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              textStyle:
                                                                  const TextStyle(
                                                                      color: Colors
                                                                          .white)),
                                                          child: Text(
                                                            'Cancle',
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
                      ));
  }
}
