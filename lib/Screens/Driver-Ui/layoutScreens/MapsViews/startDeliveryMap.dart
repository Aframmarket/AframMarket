import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/delivery_map_provider.dart';
import 'deliveryMapBody.dart';

class StartDeliverMapScreen extends StatelessWidget {
  final String destinationAddress;
  final bool isViewing;

  const StartDeliverMapScreen({super.key, required this.destinationAddress, required this.isViewing});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => DeliveryMapProvider(destinationAddress: destinationAddress),
        child: Scaffold(
          body: DeliveryMapBody(isViewing: isViewing,),
        ),
    );
  }
}
