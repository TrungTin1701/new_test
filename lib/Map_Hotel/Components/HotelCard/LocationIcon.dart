// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class LocationIcon extends StatelessWidget {
  const LocationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 0),
      child: Icon(
        Icons.location_on,
        color: Colors.black.withOpacity(0.5),
        size: 20,
      ),
    );
  }
}
