// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/HotelCard.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';

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
        // child: Container(
        //     width: MediaQuery.of(context).size.width * 0.8,
        //     height: MediaQuery.of(context).size.height * 0.45,
        //     child: HotelCard()),
        child: Container(
          height: MediaQuery.of(context).size.height / 2 * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3.0, 5.0), // changes position of shadow
                )
              ]),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 4,
            ),
            items: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: HotelCard()),
            ],
          ),
        ),
        bottom: MediaQuery.of(context).size.height / 10,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
    ]);
  }
}
