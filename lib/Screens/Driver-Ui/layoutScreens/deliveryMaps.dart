import 'dart:async';
import 'package:afram_project/Screens/Colors/colors.dart';
import 'package:afram_project/Screens/Reusables/UIText.dart';
import 'package:afram_project/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class DeliveryMapsScreen extends StatefulWidget {
  const DeliveryMapsScreen({super.key});

  @override
  State<DeliveryMapsScreen> createState() => _DeliveryMapsScreenState();
}

class _DeliveryMapsScreenState extends State<DeliveryMapsScreen> {

  // obtaining the location controller
  final Location _locationController = Location();
  LatLng? _currentP;
  final  Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  static const LatLng _sourcePosition = LatLng(6.2887293, 5.50514);
  static const LatLng _destinationPosition = LatLng(6.3154891, 5.5868628);

  // poly-lines drawing code
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdates().then((_) {
      if (_currentP != null) {
        getPolylinePoints().then((coordinates) {
          generatePolyLineFromPoints(coordinates);
        });
      }
    });
  }


  // function to point the map to a specific location
  Future<void> _cameraToPosition(LatLng pos) async{
    final GoogleMapController controller = await _mapController.future;

    CameraPosition _newCameraPosition = CameraPosition(target: pos, zoom: 13);
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  // a function to get the location updates
  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if(_serviceEnabled){
      _serviceEnabled = await _locationController.requestService();
    }
    else{
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await _locationController.requestPermission();
      if(_permissionGranted != PermissionStatus.granted){
        return;
      }
    }

    _locationController.onLocationChanged.listen((LocationData currentLocation){
      if(currentLocation.latitude != null && currentLocation.longitude != null){
        setState(() {
          _currentP = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_currentP!);
        });
      }
    });
  }

  // using flutter poly-lines for 2 points
  Future<List<LatLng>> getPolylinePoints() async {
    List<LatLng> polylinesCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey: GOOGLE_MAPS_API_KEY, request: PolylineRequest(
        origin: PointLatLng(_currentP!.latitude, _currentP!.longitude),
        destination: PointLatLng(_destinationPosition.latitude, _destinationPosition.longitude),
        mode: TravelMode.driving
    )
    );
    if (result.points.isNotEmpty){
      result.points.forEach((PointLatLng point) {
        polylinesCoordinates.add(
            LatLng(point.latitude, point.longitude)
        );
      });
    }
    else{
      print(result.errorMessage);
    }

    return polylinesCoordinates;
  }

  void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: AppColors.primaryYellowColor,
        points: polylineCoordinates, width: 8, visible: true);
    setState(() {
      polylines[id] = polyline;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: _currentP == null ? Center(child: Text("Loading........")) : GoogleMap(
        initialCameraPosition: CameraPosition(target: _currentP!, zoom: 15),
        onMapCreated: (GoogleMapController controller){
          _mapController.complete(controller);
          },
        zoomGesturesEnabled: true,
        markers: {
          Marker(
              markerId: MarkerId("_currentLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _currentP!
          ),
          Marker(
            markerId: MarkerId("_sourceLocation"),
            icon: BitmapDescriptor.defaultMarker,
            position: _sourcePosition
          ),
          Marker(
              markerId: MarkerId("_destinationLocation"),
              icon: BitmapDescriptor.defaultMarker,
              position: _destinationPosition
          ),
        },
        polylines: Set<Polyline>.of(polylines.values),
      ),
      bottomSheet: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)
              ),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search location",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 1,
                            color: AppColors.borderColor3
                          )
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.primaryGreenColor
                            )
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                width: 1,
                                color: AppColors.primaryGreenColor
                            )
                        ),
                        prefixIcon: Icon(Icons.search)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1,
                            color: AppColors.borderColor2
                          )
                        )
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width:60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                style: BorderStyle.solid,
                                color: AppColors.borderColor2
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ImageIcon(AssetImage("assets/locationPin.png"), color: AppColors.primaryYellowColor,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiText(text: 'Allentown', textColor: AppColors.darkTxt, fontSize: 12, fontWeight: FontWeight.w500,),
                              SizedBox(height: 8,),
                              UiText(text: '4140 Parker Allentown, New Mexico 31134', textColor: AppColors.lightTxt, fontSize: 10, fontWeight: FontWeight.w400,),
                              SizedBox(height: 8,),
                              UiText(text: '5.5 KM Away', textColor: AppColors.darkTxt, fontSize: 10, fontWeight: FontWeight.w700,),
                              SizedBox(height: 8,),
                              UiText(text: 'Closed', textColor: AppColors.textRed, fontSize: 10, fontWeight: FontWeight.w400,),
                            ],
                          ),

                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.darkTxt,)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.borderColor2
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width:60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: AppColors.borderColor2
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ImageIcon(AssetImage("assets/locationPin.png"), color: AppColors.primaryYellowColor,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiText(text: 'Allentown', textColor: AppColors.darkTxt, fontSize: 12, fontWeight: FontWeight.w500,),
                              SizedBox(height: 8,),
                              UiText(text: '4140 Parker Allentown, New Mexico 31134', textColor: AppColors.lightTxt, fontSize: 10, fontWeight: FontWeight.w400,),
                              SizedBox(height: 8,),
                              UiText(text: '5.5 KM Away', textColor: AppColors.darkTxt, fontSize: 10, fontWeight: FontWeight.w700,),
                              SizedBox(height: 8,),
                              UiText(text: 'Available', textColor: AppColors.textGreen, fontSize: 10, fontWeight: FontWeight.w400,),
                            ],
                          ),

                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.darkTxt,)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: AppColors.borderColor2
                              )
                          )
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width:60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1,
                                  style: BorderStyle.solid,
                                  color: AppColors.borderColor2
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ImageIcon(AssetImage("assets/locationPin.png"), color: AppColors.primaryYellowColor,),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UiText(text: 'Allentown', textColor: AppColors.darkTxt, fontSize: 12, fontWeight: FontWeight.w500,),
                              SizedBox(height: 8,),
                              UiText(text: '4140 Parker Allentown, New Mexico 31134', textColor: AppColors.lightTxt, fontSize: 10, fontWeight: FontWeight.w400,),
                              SizedBox(height: 8,),
                              UiText(text: '5.5 KM Away', textColor: AppColors.darkTxt, fontSize: 10, fontWeight: FontWeight.w700,),
                              SizedBox(height: 8,),
                              UiText(text: 'Closed', textColor: AppColors.textGreen, fontSize: 10, fontWeight: FontWeight.w400,),
                            ],
                          ),

                          Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.darkTxt,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ),
          Positioned(
            top: -13,
            left: screenWeight * 0.42,
            child: Container(
              height: 25,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: screenHeight * -0.5,
            left: 10,
            child: Container(
              height: 50,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.black,
              ),
              child: Center(
                  child: UiText(text: "Nearby Delivery", textColor: Colors.white, fontSize: 17, fontWeight: FontWeight.w700)),
            ),
          )
        ],
      )
    );
  }
}
