import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarKersRemote {
  MarKersRemote();
  final stateStreamController = StreamController<Set<Marker>>();
  final cameraStreamcontroller = StreamController<CameraPosition>();
  StreamSink<Set<Marker>> get markersink => stateStreamController.sink;
  Stream<Set<Marker>> get markerstream => stateStreamController.stream;
  StreamSink<CameraPosition> get camerasink => cameraStreamcontroller.sink;
  Stream<CameraPosition> get camerastream => cameraStreamcontroller.stream;
}
