import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/getOpenDeliviries.dart';
import 'package:flutter/foundation.dart';

class OrderProvider with ChangeNotifier {
  List<Order> _orders = [];
  String? _errorMessage; // To store error messages
  bool _isLoading = false; // To track loading state
  List<Order> _acceptedOrders = [];
  List<Order> get acceptedOrders => _acceptedOrders; // Expose accepted orders
  List<Order> get orders => _orders;

  String? get errorMessage => _errorMessage;

  bool get isLoading => _isLoading;

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();
    _errorMessage = null; // Clear previous error messages

    try {
      final response = await http.get(Uri.parse('https://aframmarket.com/sandbox/api/deliveries/open'),
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          _orders = (data['orders'] as List).map((order) {
            return Order(
              cartSessionId: order['cart_session_id'] ?? '', // Default to empty string if null
              id: order['id'] ?? 0, // Default to 0 if null
              userId: order['userid'] ?? 0, // Default to 0 if null
              orderDate: order['orderdate'] ?? '', // Default to empty string if null
              deliveryFee: double.tryParse(order['delivery_fee']?.toString() ?? '0') ?? 0.0, // Ensure proper parsing
              shippingAddress: order['shipping_address'] ?? '', // Default to empty string if null
              products: (order['products'] as List).map((product) {
                return Product(
                  name: product['name'] ?? '', // Default to empty string if null
                  price: double.tryParse(product['price']?.toString() ?? '0') ?? 0.0, // Ensure proper parsing
                  quantity: product['quantity'] ?? 1, // Default to 1 if null
                );
              }).toList(),
              grandTotal: double.tryParse(order['grandtotal']?.toString() ?? '0') ?? 0.0, // Ensure proper parsing
              status: order['status'] ?? 0, // Include the status if available or default to 0
            );
          }).toList();
        } else {
          _errorMessage = 'Failed to load orders';
        }
      } else {
        _errorMessage = 'Failed to load orders: ${response.statusCode}';
      }
    } catch (e) {
      // Handle network errors
      if (e is http.ClientException) {
        _errorMessage = 'No network connection. Please check your internet.';
      } else {
        _errorMessage = 'An error occurred: $e';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }


  Future<void> acceptOrder(int userId, int orderId, int index) async {
    // Logic to accept the order, e.g., API call
    try {
      final response = await http.post(
        Uri.parse('https://aframmarket.com/sandbox/api/deliveries/accept_open_delivery'),
        // Replace with your actual endpoint
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'user_id': userId,
          'order_id': orderId,
        }),
      );

      if (response.statusCode == 200) {
        // Update the UI by changing the accepted status
        _orders[index].status = 1; // Assuming 1 means accepted
        notifyListeners();
      } else {
        throw Exception('Failed to accept order: ${response.statusCode}');
      }
    } catch (e) {
      // Handle errors
      print('Error accepting order: $e');
    }
  }

  void declineOrder(int index) {
    // Remove the order from the list
    _orders.removeAt(index);
    notifyListeners();
  }

  Future<void> fetchAcceptedOrders() async {
    _isLoading = true;
    notifyListeners();
    _errorMessage = null; // Clear previous error messages

    try {
      final response = await http.get(
        Uri.parse('http://aframmarket.com/sandbox/api/deliveries/ongoing?user_id=43'),
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          _acceptedOrders = (data['orders'] as List).map((order) {
            return Order(
              cartSessionId: order['cart_session_id'] ?? '',
              id: order['id'] ?? 0,
              userId: order['userid'] ?? 0,
              orderDate: order['orderdate'] ?? '',
              deliveryFee: double.tryParse(order['delivery_fee']?.toString() ?? '0') ?? 0.0,
              shippingAddress: order['shipping_address'] ?? '',
              products: (order['products'] as List).map((product) {
                return Product(
                  name: product['name'] ?? '',
                  price: double.tryParse(product['price']?.toString() ?? '0') ?? 0.0,
                  quantity: product['quantity'] ?? 1,
                );
              }).toList(),
              grandTotal: double.tryParse(order['grandtotal']?.toString() ?? '0') ?? 0.0,
              status: order['status'] ?? 0,
            );
          }).toList();
        } else {
          _errorMessage = 'Failed to load accepted orders';
        }
      } else {
        _errorMessage = 'Failed to load accepted orders: ${response.statusCode}';
      }
    } catch (e) {
      // Handle network errors
      if (e is http.ClientException) {
        _errorMessage = 'No network connection. Please check your internet.';
      } else {
        _errorMessage = 'An error occurred: $e';
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
