import 'dart:convert';
import 'package:afram_project/Screens/Driver-Ui/Models/driverUserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DriverSignUpProvider with ChangeNotifier {
  // Replace with your actual API endpoint
  final String _apiUrl = 'https://aframmarket.com/sandbox/api/account/register-driver';

  bool _isLoading = false;
  String? _errorMessage;
  String? _successMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get successMessage => _successMessage;

  Future<bool> signUp(DriverSignUpModel user) async {
    _isLoading = true;
    _errorMessage = null;
    _successMessage = null;
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
        // Assuming the API sends a success message and possibly other data
        final responseData = json.decode(response.body);
        _successMessage = responseData['message'] ?? 'Sign up successful! A code has been sent to your email.';
        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        // Parse the error message from the response if available
        final responseData = json.decode(response.body);
        _errorMessage = responseData['error'] ?? 'Failed to sign up. Please try again.';
        print(_errorMessage);
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      _errorMessage = 'An error occurred: $e';
      print(_errorMessage);
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
