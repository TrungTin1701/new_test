// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/HotelCard.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBody extends StatefulWidget {
  const MapBody({Key? key}) : super(key: key);

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  // static const _initialPosition =
  //     CameraPosition(target: LatLng(37.773972, 122.431297), zoom: 15);
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Color.fromARGB(255, 169, 147, 147),
        // child: GoogleMap(
        //   myLocationButtonEnabled: false,
        //   zoomControlsEnabled: false,
        //   initialCameraPosition: _initialPosition,
        // ),
      ),
      Positioned(
        child: HotelCard(),
        bottom: MediaQuery.of(context).size.height / 10,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
    ]);
  }
}
