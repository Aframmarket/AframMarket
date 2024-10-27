import 'dart:convert';
import 'package:afram_project/Screens/Driver-Ui/Models/driverModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpProvider with ChangeNotifier {
  // Replace with your actual API endpoint
  final String _apiUrl = 'https://aframmarket.com/sandbox/api/driver/complete-registration';

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> signUp(DriverModel user) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
        body: json.encode(user.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Assuming the API returns a success message
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        // Handle errors based on response
        _errorMessage = 'Failed to sign up. Please try again.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
