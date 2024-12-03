import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/dashboard_summary.dart';

class DashboardProvider with ChangeNotifier {
  DashboardSummary? _summary;
  bool _isLoading = false;
  String? _error;

  DashboardSummary? get summary => _summary;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchDashboardSummary(int userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final url = Uri.parse('https://aframmarket.com/sandbox/api/driver/dashboard-summary/user/$userId');

    try {
      final response = await http.get(
        url,
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);

        if (jsonData['status'] == 'success') {
          _summary = DashboardSummary.fromJson(jsonData);
        } else {
          _error = 'Failed to load data: ${jsonData['message'] ?? 'Unknown error'}';
        }
      } else {
        _error = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'An error occurred: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
