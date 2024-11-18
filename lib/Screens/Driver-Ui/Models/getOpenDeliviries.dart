import 'package:flutter/foundation.dart';

class Order {
  final String cartSessionId;
  final int id;
  final int userId;
  final String orderDate;
  final double deliveryFee;
  final String shippingAddress;
  final List<Product> products;
  final double grandTotal;
  int status; // Field to track the order's acceptance status

  Order({
    required this.cartSessionId,
    required this.id,
    required this.userId,
    required this.orderDate,
    required this.deliveryFee,
    required this.shippingAddress,
    required this.products,
    required this.grandTotal,
    this.status = 0, // Default status to 0 (not accepted)
  });
}



class Product {
  final String name;
  final double price;
  final int quantity;

  Product({required this.name, required this.price, required this.quantity});
}