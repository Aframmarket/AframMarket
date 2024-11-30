
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class FileUploadProvider with ChangeNotifier{
  File? _selectedFile;
  bool _isUploading = false;

  File? get selectedFile => _selectedFile;
  bool get isUploading => _isUploading;

  // Method to pick a file
  Future<void> pickFile() async {
    FilePickerResult?  result = await FilePicker.platform.pickFiles();

    if (result != null && result.files.single.path != null) {
      _selectedFile = File(result.files.single.path!);
      notifyListeners();
    }
  }

  // Method to upload file to server
  Future<void> uploadFile(BuildContext context) async {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file selected')),
      );
      return;
    }

    _isUploading = true;
    notifyListeners();

    final url = Uri.parse('https://aframmarket.com/sandbox/api/driver/driver-uploads'); // Replace with your API endpoint

    try {
      var request = http.MultipartRequest('POST', url);

      // If your API requires additional fields, add them here
      // request.fields['userid'] = '80';
      // request.fields['password'] = 'Fa12345@';

      String fileName = _selectedFile!.path.split('/').last;

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          _selectedFile!.path,
          filename: fileName,
        ),
      );

      var response = await request.send();

      _isUploading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('File uploaded successfully')),
        );
        // Clear the selected file after successful upload
        _selectedFile = null;
        notifyListeners();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Upload failed: ${response.statusCode}')),
        );
      }
    } catch (e) {
      _isUploading = false;
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    }
  }
}
