import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import '../../../const.dart';


class DeliveryMapProvider with ChangeNotifier {
  final loc.Location _locationController = loc.Location();
  LatLng? _currentPosition;
  LatLng? _destinationPosition;
  Map<PolylineId, Polyline> _polylines = {};
  Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();

  LatLng? get currentPosition => _currentPosition;
  LatLng? get destinationPosition => _destinationPosition;
  Map<PolylineId, Polyline> get polylines => _polylines;
  Completer<GoogleMapController> get mapController => _mapController;

  DeliveryMapProvider() {
    _initLocationUpdates();
  }

  Future<void> _initLocationUpdates() async {
    bool serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    loc.PermissionStatus permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged.listen((loc.LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
        notifyListeners();
        _updateCameraPosition(_currentPosition!);
      }
    });
  }

  Future<void> setDestinationAddress(String address) async {
    try {
      List<geocoding.Location> locations = await geocoding.locationFromAddress(address);
      if (locations.isNotEmpty) {
        _destinationPosition = LatLng(
          locations[0].latitude,
          locations[0].longitude,
        );
        notifyListeners();
        _drawPolyline();
      }
    } catch (e) {
      print('Error in geocoding: $e');
    }
  }

  Future<void> _drawPolyline() async {
    if (_currentPosition == null || _destinationPosition == null) return;

    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: GOOGLE_MAPS_API_KEY,
        request: PolylineRequest(
            origin: PointLatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            destination: PointLatLng(_destinationPosition!.latitude, _destinationPosition!.longitude),
            mode: TravelMode.driving
        )
    );

    if (result.points.isNotEmpty) {
      List<LatLng> polylineCoordinates = [];
      for (PointLatLng point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      _addPolyline(polylineCoordinates);
    } else {
      print('Error fetching polyline: ${result.errorMessage}');
    }
  }

  void _addPolyline(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 5,
    );
    _polylines[id] = polyline;
    notifyListeners();
  }

  Future<void> _updateCameraPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition cameraPosition = CameraPosition(target: position, zoom: 14);
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
