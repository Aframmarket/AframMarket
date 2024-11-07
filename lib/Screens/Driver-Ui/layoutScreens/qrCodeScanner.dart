import 'dart:io';
import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({super.key});

  @override
  State<QrCodeScanner> createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  final ImagePicker _picker = ImagePicker();
  String? _scannedCode;
  File? _uploadedImage;

  void _scanQRCode() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: SizedBox(
          width: 300,
          height: 400,
          child: MobileScanner(
            onDetect: (BarcodeCapture barcodeCapture) {
              final List<Barcode> barcodes = barcodeCapture.barcodes;
              if (barcodes.isNotEmpty) {
                setState(() {
                  // Assuming we are only interested in the first detected barcode
                  _scannedCode = barcodes.first.rawValue ?? 'No value';
                });
                Navigator.of(context).pop(); // Close the scanner
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Scanned Code: $_scannedCode")),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<void> _uploadFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _uploadedImage = File(image.path);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Image uploaded from gallery")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _uploadedImage != null
              ? Image.file(_uploadedImage!, height: 200)
              : Center(
                child: SizedBox(
                    height: 250,
                    width: 250,
                    child: Stack(
                        children: [
                          Image(image: AssetImage("assets/scann.png"), fit: BoxFit.cover,),
                          Center(
                            child: SizedBox(
                                height: 220,
                                width: 220,
                                child: Image(image: AssetImage("assets/QrImage.png"), fit: BoxFit.cover,)
                            ),
                          )
                        ]
                    ),
                  ),
              ),
          SizedBox(height: 20),
          UiText(text: "Scan to capture parcel", textColor: AppColors.darkTxt2, fontSize: 20, fontWeight: FontWeight.w400),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              textAlign: TextAlign.center,
                text: TextSpan(
                  text: "or click here to ",
                    style: GoogleFonts.sen(
                      color: AppColors.darkTxt2,
                      textStyle: Theme.of(context).textTheme.displayLarge,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  children: [
                    TextSpan(
                      text: "Upload",
                      recognizer: TapGestureRecognizer()
                        ..onTap = _uploadFromGallery,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryYellowColor,
                        color: AppColors.primaryYellowColor
                      )
                    ),
                    TextSpan(
                      text: " parcel from gallery"
                    )
                  ]
                )
            ),
          ),
          // TextButton(
          //   onPressed: _uploadFromGallery,
          //   child: Text(
          //     "UPLOAD",
          //     style:
          //         TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          //   ),
          // ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: _scanQRCode,
              child: UiText(
              text: "Scan instead",
              textColor: AppColors.primaryYellowColor,
              fontSize: 20,
              fontWeight: FontWeight.w400)
          ),
          // ElevatedButton(
          //   onPressed: _scanQRCode,
          //   style: ElevatedButton.styleFrom(
          //     foregroundColor: Colors.white,
          //     backgroundColor: Colors.yellow[600],
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          //   child: Text("Completed"),
          // ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: LargeBtn(btnText: "Upload", btnColor: AppColors.primaryYellowColor, onTap: (){}, btnTextColor: Colors.white),
          )
        ],
      ),
    );
  }
}
