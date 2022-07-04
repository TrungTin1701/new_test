// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/ImageHotel.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/InfoHotel.dart';

class HotelCard extends StatefulWidget {
  const HotelCard({Key? key}) : super(key: key);

  @override
  State<HotelCard> createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: Row(
            children: [
              Expanded(child: ImageCard(), flex: 1),
              Expanded(child: InfoCard(), flex: 2),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height / 5),
    );
  }
}
