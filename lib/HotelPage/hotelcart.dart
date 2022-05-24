import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_test/HomePage/homepage.dart';
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
    color: Color.fromARGB(255, 255, 255, 255),
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
        SizedBox(width: 10),
        TextEditor("Số người", "1 Người Lớn 2 Trẻ Em", context),
        SizedBox(width: 10),
        Datebook("Ngày Nhận Phòng", Date1, context),
        Datebook("Ngày Trả Phòng", date2, context),
        //Bill
        Payment("Tổng Thanh Toán", "4 450 000 VND", context),
        const SizedBox(height: 20),
        buildButton(context),
      ],
    ),
  );
}

bool isReadmore() {
  return false;
}
