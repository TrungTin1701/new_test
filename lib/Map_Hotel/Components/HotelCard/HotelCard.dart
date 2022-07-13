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
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height / 4),
    );
  }
}
