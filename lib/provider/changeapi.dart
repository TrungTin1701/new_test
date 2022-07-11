import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeLocation with ChangeNotifier {
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition kGooglePlex1 = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  void changeLocation(CameraPosition position) {
    kGooglePlex1 = position;
    notifyListeners();
  }
}
