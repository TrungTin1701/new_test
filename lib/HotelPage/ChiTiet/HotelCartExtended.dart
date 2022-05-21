// ignore: file_names
import 'package:flutter/material.dart';
import 'package:new_test/Profile/profile.dart';

DateTime _now = DateTime.now();
// ignore: non_constant_identifier_names
DateTime Date = new DateTime(_now.year, _now.month, _now.day);
// ignore: non_constant_identifier_names
void runapp() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const ProfileApp(),
  ));
}

Widget HotelCard1(
  String imgurl,
  String Hotelname,
  String location,
  BuildContext context,
) {
  var borderRadius2 = BorderRadius.circular(10);
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
    margin: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.0, color: Colors.transparent),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(imgurl),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(3, 3),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.1))
                  ]),
            ),
            const SizedBox(
              width: 21,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0, bottom: 0),
                    child: Text(
                      Hotelname,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10.5,
                  ),
                  const Text.rich(TextSpan(children: [
                    TextSpan(
                        text: '\$',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black)),
                    TextSpan(
                        text: '200',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ])),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: const [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Loại Phòng",
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 92, 90, 90)),
              ),
            ),
            SizedBox(width: 10),
            // ignore: prefer_const_constructors
            Expanded(
                child: Text(
              "President Room",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 44, 91, 138)),
              textAlign: TextAlign.end,
            )),
          ],
        ),
        Row(
          children: const [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 0),
                child: Text(
                  "Số Người",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 92, 90, 90)),
                ),
              ),
            ),
            SizedBox(width: 10),
            // ignore: prefer_const_constructors
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "1 người lớn , 2 trẻ em",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 19, 9, 9)),
                textAlign: TextAlign.end,
              ),
            )),
          ],
        ),
        Row(
          children: const [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Text(
                  "Ngày nhận Phòng",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 92, 90, 90)),
                ),
              ),
            ),
            SizedBox(width: 10),
            // ignore: prefer_const_constructors
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                "T6/12/2019",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 135, 41, 41)),
                textAlign: TextAlign.end,
              ),
            )),
          ],
        ),
        Row(
          children: const [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Text(
                  "Ngày Trả Phòng",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 92, 90, 90)),
                ),
              ),
            ),
            SizedBox(width: 10),
            // ignore: prefer_const_constructors
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                "T6/12/2029",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 135, 41, 41)),
                textAlign: TextAlign.end,
              ),
            )),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Mã Phòng',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                TextSpan(
                    text: ' !',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ])),
            ),

            SizedBox(width: 10),
            // ignore: prefer_const_constructors
            Expanded(
                child: Text(
              "VIP 001",
              style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.end,
            )),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: const Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Tổng Thanh Toán',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                TextSpan(
                    text: '\ !',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ])),
            ),

            SizedBox(width: 10),
            // ignore: prefer_const_constructors
            Expanded(
                child: Text(
              "4.630.000 VND",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              textAlign: TextAlign.end,
            )),
          ],
        ),
      ],
    ),
  );
}

bool isReadmore() {
  return false;
}
