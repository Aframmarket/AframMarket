import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/largeButton.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';

class AccessLocationScreen extends StatefulWidget {
  const AccessLocationScreen({super.key});

  @override
  State<AccessLocationScreen> createState() => _AccessLocationScreenState();
}

class _AccessLocationScreenState extends State<AccessLocationScreen> {

  String _locationMessage = '';
  late Stream<Position> _positionStream;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    // Check location permission and start listening for location updates
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setState(() {
          _locationMessage = 'Location permissions are denied.';
        });
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = 'Location permissions are permanently denied. Please enable them in settings.';
      });
      return;
    }

    // Start listening to the location updates if permission is granted
    _startListening();
  }

  void _startListening() {
    //maybe I'll remove later
    _isListening = true;
    _positionStream = Geolocator.getPositionStream(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high, // Specify the desired accuracy
        distanceFilter: 150, // Set the minimum distance filter in meters
      ),
    );

    _positionStream.listen((Position position) {
      setState(() {
        _locationMessage = 'Location: ${position.latitude}, ${position.longitude}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: screenHeight * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image(
                    image: AssetImage("assets/gpsBg.png")
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                LargeBtn(
                    btnText: "Access location",
                    btnColor: AppColors.primaryYellowColor,
                    onTap: () async {
                      await _checkLocationPermission();
                      //navigate to home screen when location is accessed.
                      Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                    },
                    btnTextColor: Colors.white
                ),
                SizedBox(
                  height: 70
                ),
                // SizedBox(height: 20),
                // Text(_locationMessage.isNotEmpty ? _locationMessage : 'Waiting for location...'),
                Text(
                  "Aframmarket will only access your location while using the app",
                  style: GoogleFonts.sen(
                  color: AppColors.lightTxt2,
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayLarge,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    // Stop listening to location updates if necessary
    if (_isListening) {
      // Implement stopping the listener if you need to
      // _positionStream.cancel(); // Uncomment if you maintain the subscription
    }
  }
}
