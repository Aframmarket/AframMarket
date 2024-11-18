import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Reusables/UIText.dart';
import '../provider/openDelivery_provider.dart';

class OngoingDeliveryScreen extends StatefulWidget {
  @override
  _OngoingDeliveryScreenState createState() => _OngoingDeliveryScreenState();
}

class _OngoingDeliveryScreenState extends State<OngoingDeliveryScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch accepted orders when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<OrderProvider>(context, listen: false).fetchAcceptedOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(title: Text('Accepted Deliveries')),
      body: orderProvider.isLoading
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
                                  OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: AppColors.textGreen,
                                        side: BorderSide(
                                            width: 2, color: Colors.white),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0),
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
                    ),
    );
  }
}
