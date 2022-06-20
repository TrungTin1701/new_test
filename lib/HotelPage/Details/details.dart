// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '/HotelPage/Details/HotelCartExtended.dart';

// ignore: camel_case_types
Widget chitiet(
  String imgurl,
  String Hotelname,
  String location,
  BuildContext context,
  String Date1,
  String date2,
) {
  return Scaffold(
    appBar: AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
      title: const Text("BOOKING HOTEL ROOM"),
      centerTitle: true,
      actions: const [Icon(Icons.more_vert)],
      backgroundColor: const Color.fromARGB(255, 59, 160, 175),
    ),
    body: HotelCard1(imgurl, Hotelname, location, context, Date1, date2),
  );
}
