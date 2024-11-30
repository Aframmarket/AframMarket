import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import '../HiveModels/company.dart';
import '../HiveModels/upload.dart';
import '../HiveModels/user.dart';
import '../Services/custom_cache_manager.dart';
import '../Services/image_service.dart';

class UserProvider with ChangeNotifier {
  final _secureStorage = FlutterSecureStorage();

  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  // Constructor
  UserProvider() {
    _initializeHive();
    _loadUserData();
  }

  // Initialize Hive and register adapters
  void _initializeHive() {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserAdapter());
      Hive.registerAdapter(CompanyAdapter());
      Hive.registerAdapter(UploadAdapter());
    }
  }

  // Load user data from Hive
  Future<void> _loadUserData() async {
    try {
      _isLoading = true;
      notifyListeners();

      final encryptionKey = await _getEncryptionKey();
      var userBox = await Hive.openBox<User>(
        'userBox',
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      _user = userBox.get('currentUser');

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _errorMessage = 'Error loading user data: $e';
      notifyListeners();
    }
  }

  // Get or generate encryption key
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

  // Update user profile
  Future<void> updateUserProfile({
    required String firstname,
    required String lastname,
    required String email,
    required String phoneNumber,
  }) async {
    if (_user == null) {
      _errorMessage = 'User data not found.';
      notifyListeners();
      return;
    }

    bool hasChanges = false;

    if (_user!.firstname != firstname) {
      _user!.firstname = firstname;
      hasChanges = true;
    }
    if (_user!.lastname != lastname) {
      _user!.lastname = lastname;
      hasChanges = true;
    }
    if (_user!.email != email) {
      _user!.email != email;
      hasChanges = true;
    }
    if (_user!.phone != phoneNumber) {
      _user!.phone != phoneNumber;
      hasChanges = true;
    }

    if (hasChanges) {
      await _sendUpdateRequest();
    } else {
      _errorMessage = 'No changes detected.';
      notifyListeners();
    }
  }

  // Send update request to API
  Future<void> _sendUpdateRequest() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    Map<String, dynamic> dataToSend = {
      "firstname": _user!.firstname,
      "lastname": _user!.lastname,
      "businessname": _user!.company.businessName,
      "address": _user!.company.address,
      "zipcode": _user!.company.zipCode,
      "city": _user!.company.city,
      "state": _user!.company.state,
      "vehicle_type": _user!.company.vehicleType,
      "email": _user!.email,
      "paypal_email": _user!.company.paypalEmail,
      "phone": _user!.phone,
      "driverid": _user!.id.toString(),
      "userid": _user!.id.toString(),
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost/aframm/api/driver/update-profile'),
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
        body: json.encode(dataToSend),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          print('Update successful.');
          await _updateLocalUserData();
          _isLoading = false;
          notifyListeners();
        } else {
          _errorMessage = responseData['message'] ?? 'Update failed.';
          print(_errorMessage);
          _isLoading = false;
          notifyListeners();
        }
      } else {
        _errorMessage = 'HTTP Error: ${response.statusCode}';
        _isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error sending update request: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update local Hive data
  Future<void> _updateLocalUserData() async {
    try {
      final encryptionKey = await _getEncryptionKey();
      var userBox = await Hive.openBox<User>(
        'userBox',
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      await userBox.put('currentUser', _user!);
      print('Local user data updated.');
    } catch (e) {
      _errorMessage = 'Error updating local user data: $e';
      notifyListeners();
    }
  }

  // login function
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://aframmarket.com/sandbox/api/account/login'),
        headers: {
          'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
          'Content-Type': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['status'] == 'success') {
          // Parse user data and token
          _user = User.fromJson(responseData['user']);

          // Store user data locally
          await _updateLocalUserData();

          _isLoading = false;
          notifyListeners();
          return true;
        } else {
          _errorMessage = responseData['message'] ?? 'Login failed.';
          _isLoading = false;
          notifyListeners();
          return false;
        }
      } else {
        _errorMessage = 'Incorrect email or password';
        _isLoading = false;
        notifyListeners();
        return false;
      }
    }
    on SocketException catch (e){
      _errorMessage = 'Please check your internet connection';
      _isLoading = false;
      notifyListeners();
      return false;
    }
    catch (e) {
      _errorMessage = 'Something went wrong, ensure you have a strong internet connection.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      final encryptionKey = await _getEncryptionKey();
      var userBox = await Hive.openBox<User>(
        'userBox',
        encryptionCipher: HiveAesCipher(encryptionKey),
      );
      await userBox.delete('currentUser');
      _user = null;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Failed to logout: $e';
      notifyListeners();
    }
  }


  // Update profile picture
  Future<void> updateProfilePicture() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Request permissions
      if (await Permission.storage.request().isGranted) {
        // Proceed to pick image
      } else {
        _errorMessage = 'Storage permission denied.';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Pick an image
      File? imageFile = await pickImage();
      if (imageFile == null) {
        _errorMessage = 'No image selected.';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Save the compressed image locally
      String? imagePath = await saveCompressedImage(imageFile);
      if (imagePath == null) {
        _errorMessage = 'Failed to save image.';
        _isLoading = false;
        notifyListeners();
        return;
      }

      // Delete the old profile picture if it exists
      if (_user?.profilePicturePath != null) {
        File oldImageFile = File(_user!.profilePicturePath!);
        if (await oldImageFile.exists()) {
          await oldImageFile.delete();
        }
      }

      // Update the user model
      _user?.profilePicturePath = imagePath;

      // Update local Hive data
      await _updateLocalUserData();

      // Clear cache to refresh the image
      await ProfilePictureCacheManager.instance.emptyCache();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = 'Error updating profile picture: $e';
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<Uint8List?> getCachedProfilePictureBytes() async {
    if (_user?.profilePicturePath == null) {
      return null;
    }
    try {
      File imageFile = File(_user!.profilePicturePath!);
      if (await imageFile.exists()) {
        Uint8List imageBytes = await imageFile.readAsBytes();
        return imageBytes;
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting profile picture bytes: $e');
      return null;
    }
  }
}
