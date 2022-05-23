import 'package:flutter/material.dart';

var color_text1 = Color.fromARGB(255, 92, 90, 90);
var color_bookingroom = Color.fromARGB(255, 135, 41, 41);
var color_payment = Color(Colors.black.value);
// Text
Widget TextEditor(String text1, String text2, BuildContext context) {
  double width1 = MediaQuery.of(context).size.width;
  double height1 = MediaQuery.of(context).size.height;
  var borderRadius2 = BorderRadius.circular(10);
  return Row(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(left: 0, right: 0, bottom: 10),
          child: Container(
            constraints: BoxConstraints(maxWidth: 70),
            child: Text(
              text1,
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: color_text1),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      // ignore: prefer_const_constructors
      Expanded(
          child: Container(
        constraints: BoxConstraints(maxWidth: width1 - 80),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            text2,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 44, 91, 138)),
            textAlign: TextAlign.end,
          ),
        ),
      )),
    ],
  );
}

//Date Booking and Return
Widget Datebook(String text1, String date1, BuildContext context) {
  double width1 = MediaQuery.of(context).size.width;
  double height1 = MediaQuery.of(context).size.height;
  var borderRadius2 = BorderRadius.circular(10);
  return Row(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 0, bottom: 10),
          child: Container(
            constraints: BoxConstraints(maxWidth: 120),
            child: Text(
              "Ngày nhận Phòng",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: color_text1),
            ),
          ),
        ),
      ),
      SizedBox(width: 10),
      // ignore: prefer_const_constructors
      Expanded(
          child: Padding(
        padding: EdgeInsets.only(top: 0, bottom: 10),
        child: Container(
          constraints: BoxConstraints(maxWidth: width1 - 120),
          child: Text(
            date1,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: color_bookingroom),
            textAlign: TextAlign.end,
          ),
        ),
      )),
    ],
  );
}

// Payment
Widget Payment(String bills, String money, BuildContext context) {
  double width1 = MediaQuery.of(context).size.width;
  double height1 = MediaQuery.of(context).size.height;
  var borderRadius2 = BorderRadius.circular(10);
  return Row(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 0, bottom: 10),
        child: Container(
          constraints: BoxConstraints(maxWidth: width1 - 200),
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: bills,
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 92, 90, 90))),
            WidgetSpan(
                child: Padding(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.info_outline,
                color: Colors.black,
                size: 15,
              ),
            )),
          ])),
        ),
      ),

      SizedBox(width: 10),
      // ignore: prefer_const_constructors
      Expanded(
          child: Container(
        constraints: BoxConstraints(minWidth: 200, maxWidth: 300),
        child: Text(
          money,
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black),
          textAlign: TextAlign.end,
        ),
      )),
    ],
  );
}
