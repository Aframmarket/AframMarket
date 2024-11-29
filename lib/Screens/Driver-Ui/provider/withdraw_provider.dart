import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../Reusables/success.dart';

class WithdrawProvider with ChangeNotifier{
  final String _apiUrl = 'http://localhost/aframm/api/driver/withdraw';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> makeWithDrawal(BuildContext context, String userId, String password, String amount) async{
    _isLoading = true;
    notifyListeners();

    final body = {
      "userid": userId,
      "password": password,
      "amount": int.parse(amount)
    };

    try{
      final response = await http.post(Uri.parse(_apiUrl), headers: {
        'API-Key': 'aCvdsQwr4QgddXoiPJB9BeA8YmPva5sZm2',
        'Content-Type': 'application/json',
      }, body: json.encode(body));

      _isLoading = false;
      notifyListeners();


      if (response.statusCode == 200) {
        // Assuming a successful response returns status code 200
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Request was successful!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SuccessScreen(text: amount.toString())),
        );
      } else {
        // Handle error responses
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${response.statusCode}')),
        );
      }

    }
    catch(e){
      _isLoading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}