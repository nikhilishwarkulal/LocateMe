import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeMapView extends StatelessWidget {
  final Completer<GoogleMapController> mapController;
  final Set<Marker> marker;

  /// [HomeMapView] will handle the mapview
  const HomeMapView(
      {super.key, required this.mapController, required this.marker});

  /// [_kGooglePlex] initial position and zoom level
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
      markers: marker,
    );
  }
}
