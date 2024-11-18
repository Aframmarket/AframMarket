import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/openDelivery_provider.dart';

class OpenDeliveriesScreen extends StatefulWidget {
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
      appBar: AppBar(title: Text('Open Deliveries')),
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
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order ID: ${order.id}'),
                                Text('Order Date: ${order.orderDate}'),
                                Text('Total: \$${order.grandTotal}'),
                                Text(
                                    'Shipping Address: ${order.shippingAddress}'),
                                SizedBox(height: 10),
                                Text('Products:'),
                                ...order.products.map((product) => Text(
                                    '${product.name} (x${product.quantity}) - \$${product.price * product.quantity}')),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    order.status == 1 // If order is accepted
                                        ? Text('Accepted',
                                            style:
                                                TextStyle(color: Colors.green))
                                        : Row(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await orderProvider
                                                      .acceptOrder(order.userId,
                                                          order.id, index);
                                                },
                                                child: Text('Accept'),
                                              ),
                                              SizedBox(width: 8),
                                              // Add some space between the buttons
                                              ElevatedButton(
                                                onPressed: () {
                                                  orderProvider
                                                      .declineOrder(index);
                                                },
                                                child: Text('Decline'),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
    );
  }
}
