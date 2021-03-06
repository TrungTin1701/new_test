// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: double.maxFinite,
      child: Expanded(
        // ignore: duplicate_ignore
        child: OutlinedButton(
          onPressed: () => {
            // context.read<ChangeLocation>().changeLocation(
            //       CameraPosition(
            //         target: LatLng(37.42796133580664, -122.085749655962),
            //         zoom: 14.4746,
            //       ),
            //     ),
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            primary: Colors.blueAccent,
            backgroundColor: Color.fromARGB(255, 74, 158, 227),
            side: const BorderSide(
              color: Colors.blueAccent,
              width: 1,
            ),
          ),
          child: Text(
            ("Xem Chi Tiết"),
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ),
    );
  }
}
