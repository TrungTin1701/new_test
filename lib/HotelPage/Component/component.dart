import 'package:flutter/material.dart';

Widget TextEditor(String text1, String text2, BuildContext context) {
  double width1 = MediaQuery.of(context).size.width;
  double height1 = MediaQuery.of(context).size.height;
  var borderRadius2 = BorderRadius.circular(10);
  return Row(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: Container(
            constraints: BoxConstraints(maxWidth: 70),
            child: Text(
              text1,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 92, 90, 90)),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      // ignore: prefer_const_constructors
      Expanded(
          child: Container(
        constraints: BoxConstraints(maxWidth: width1 - 80),
        child: Text(
          text2,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 44, 91, 138)),
          textAlign: TextAlign.end,
        ),
      )),
    ],
  );
}
