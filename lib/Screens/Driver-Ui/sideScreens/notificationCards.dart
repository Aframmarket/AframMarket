import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/openDelivery_provider.dart';

class NotificationCards extends StatefulWidget {
  const NotificationCards({super.key});

  @override
  State<NotificationCards> createState() => _NotificationCardsState();
}

class _NotificationCardsState extends State<NotificationCards> {

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

    //calling the provider
    final orderProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
    );
  }
}
