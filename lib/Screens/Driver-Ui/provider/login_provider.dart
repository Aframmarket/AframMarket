import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../HiveModels/company.dart';
import '../HiveModels/upload.dart';
import '../HiveModels/user.dart';

class LoginProvider with ChangeNotifier {
  final String _apiUrl = 'https://aframmarket.com/sandbox/api/account/login'; // Replace with your actual API endpoint
  final _secureStorage = FlutterSecureStorage();

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Constructor
  LoginProvider() {
    _initializeHive();
  }

  // Initialize Hive and register adapters
  void _initializeHive() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
      Hive.registerAdapter(CompanyAdapter());
      Hive.registerAdapter(UploadAdapter());
    }
  }

  Future<bool> login(String email, String password) async {
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
        body: json.encode({'email': email, 'password': password}),
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData['status'] == 'success') {
        // Parse the user data
        Map<String, dynamic> userJson = responseData['user'];

        // Create a User object
        User user = User.fromJson(userJson);

        // Store the user data in Hive
        await _storeUserData(user);

        _isLoading = false;
        notifyListeners();
        return true;
      } else {
        // Handle errors from the API
        _errorMessage = responseData['message'] ?? 'Login failed.';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      // Handle any exceptions
      _errorMessage = 'Something went wrong while trying to login, ensure u have a good internet connection.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> _storeUserData(User user) async {
    try {
      final encryptionKey = await _getEncryptionKey();
      var userBox = await Hive.openBox<User>(
        'userBox',
        encryptionCipher: HiveAesCipher(encryptionKey),
      );

      await userBox.put('currentUser', user);
    } catch (e) {
      _errorMessage = 'Failed to store user data.';
    }
  }

  Future<List<int>> _getEncryptionKey() async {
    final keyString = await _secureStorage.read(key: 'hiveKey');
    if (keyString != null) {
      return base64Url.decode(keyString);
    } else {
      final key = Hive.generateSecureKey();
      await _secureStorage.write(key: 'hiveKey', value: base64Url.encode(key));
      return key;
    }
  }

  Future<void> logout() async {
    try {
      final encryptionKey = await _getEncryptionKey();
      var userBox = await Hive.openBox<User>(
        'userBox',
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      await userBox.delete('currentUser');
    } catch (e) {
      _errorMessage = 'Failed to logout.';
    }
  }
}
