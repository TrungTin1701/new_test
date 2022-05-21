import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/Profile/profile.dart';
import 'Details/Details.dart';
import 'Details/HotelCartExtended.dart';
import 'Component/component.dart';

// ignore: non_constant_identifier_names
void runapp() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(),
  ));
}

Widget HotelCard(
  String imgurl,
  String Hotelname,
  String location,
  BuildContext context,
  String Date1,
  String date2,
) {
  double width1 = MediaQuery.of(context).size.width;
  double height1 = MediaQuery.of(context).size.height;
  var borderRadius2 = BorderRadius.circular(10);
  return Container(
    color: Color.fromARGB(255, 238, 235, 235),
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
    margin: const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 10),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   width: 80,
            //   height: 80,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(width: 0.0, color: Colors.transparent),
            //       image: DecorationImage(
            //         fit: BoxFit.fill,
            //         image: NetworkImage(imgurl),
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //             offset: const Offset(3, 3),
            //             blurRadius: 3,
            //             color: Colors.black.withOpacity(0.1))
            //       ]),
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CachedNetworkImage(
                imageBuilder: (context, imageProvider) => Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.0, color: Colors.transparent),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(2, 2),
                            blurRadius: 3,
                            color: Colors.black.withOpacity(0.1))
                      ]),
                ),
                fit: BoxFit.cover,
                imageUrl: imgurl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.red,
                ),
              ),
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
                      child: Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 2, left: 0, bottom: 2),
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 15,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: '$location',
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 10.5,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: 'Mã đặt phòng',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 73, 72, 72),
                      ),
                    ),
                    TextSpan(
                      text: ':',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 73, 72, 72),
                      ),
                    ),
                    TextSpan(
                        text: '19127463',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 9, 225, 70))),
                  ])),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextEditor("Room", "Pressident Room", context),
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10, left: 0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 70,
                  ),
                  child: Text(
                    "Số Người",
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
                child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                constraints: BoxConstraints(maxWidth: width1 - 80),
                child: Text(
                  "1 người lớn , 2 trẻ em",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 19, 9, 9)),
                  textAlign: TextAlign.end,
                ),
              ),
            )),
          ],
        ),
        Row(
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
                        color: Color.fromARGB(255, 92, 90, 90)),
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
                  Date1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 135, 41, 41)),
                  textAlign: TextAlign.end,
                ),
              ),
            )),
          ],
        ),
        Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 10),
                child: Container(
                  constraints: BoxConstraints(maxWidth: 100),
                  child: Text(
                    "Ngày Trả Phòng",
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
                child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: width1 - 110,
                ),
                child: Text(
                  date2,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 135, 41, 41)),
                  textAlign: TextAlign.end,
                ),
              ),
            )),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: Container(
                constraints: BoxConstraints(maxWidth: width1 - 200),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                      text: 'Tổng Thanh Toán',
                      style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 92, 90, 90))),
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
                "4.630.000  VND",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                textAlign: TextAlign.end,
              ),
            )),
          ],
        ),
        Row(
          //Button
          children: <Widget>[
            Expanded(
              child: OutlinedButton(
                onPressed: () => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => (chitiet())))
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Colors.blueAccent,
                  side: BorderSide(
                    color: Colors.blueAccent,
                    width: 1,
                  ),
                ),
                // ignore: prefer_const_constructors
                child: Text(
                  (isReadmore() ? "Xem Chi Tiết" : "Xem Chi Tiết"),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 100, 179, 239)),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: OutlinedButton(
                onPressed: () => {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  primary: Colors.redAccent,
                  side: BorderSide(
                    color: Colors.redAccent,
                    width: 1,
                  ),
                ),

                // ignore: prefer_const_constructors
                child: Text(
                  "Thông Tin Hoàn Tiền",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 231, 60, 41)),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

bool isReadmore() {
  return false;
}
