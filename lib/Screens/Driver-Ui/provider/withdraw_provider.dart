import 'package:flutter/material.dart';

class WithdrawProvider with ChangeNotifier{
  final String _apiUrl = 'http://localhost/aframm/api/driver/withdraw';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  
}