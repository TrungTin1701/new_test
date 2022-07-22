// ignore_for_file: file_names, unused_element

import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Marker> _list = const [
  Marker(
    zIndex: 0,
    markerId: MarkerId('1'),
    position: LatLng(37.42830266604936, -122.09190431982279),
  ),
  Marker(
    zIndex: 0,
    markerId: MarkerId('2'),
    position: LatLng(37.429816002294984, -122.09238041192293),
  ),
  Marker(
      markerId: MarkerId('3'),
      position: LatLng(37.43397778545293, -122.08606280386448)),
  Marker(
      zIndex: 0,
      markerId: MarkerId('4'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(title: 'a')),
  Marker(
      zIndex: 0,
      markerId: MarkerId('5'),
      position: LatLng(37.43231091684314, -122.0917095243931),
      infoWindow: InfoWindow(title: "hehe")),
  Marker(
      zIndex: 0,
      markerId: MarkerId('6'),
      position: LatLng(37.42796133580664, -122.089),
      infoWindow: InfoWindow(title: 'b')),
  Marker(
      zIndex: 0,
      markerId: MarkerId('6'),
      position: LatLng(37.42796133580664, -122.090),
      infoWindow: InfoWindow(title: 'c')),
];
