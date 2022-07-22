import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChangeMarker with ChangeNotifier {
  Set<Marker> _markers = HashSet<Marker>();
  void changeMarker(Marker marker) {
    _markers.add(marker);
    notifyListeners();
  }
}
