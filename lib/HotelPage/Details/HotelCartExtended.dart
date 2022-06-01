// ignore: duplicate_ignore
// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: file_names, import_of_legacy_library_into_null_safe, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart'
    show CachedNetworkImage;
import 'package:flutter/material.dart';
import '/Profile/profile.dart';

import 'package:new_test/HotelPage/Component/component.dart';

// ignore: non_constant_identifier_names
void runapp() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(),
  ));
}

// ignore: non_constant_identifier_names
Widget HotelCard1(
  String imgurl,
  // ignore: non_constant_identifier_names
  String Hotelname,
  String location,
  BuildContext context,
  // ignore: non_constant_identifier_names
  String Date1,
  String date2,
) {
  return SafeArea(
    child: Container(
      color: Color.fromARGB(255, 255, 255, 255),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
      child: ListView(
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
                        border:
                            Border.all(width: 0.0, color: Colors.transparent),
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
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
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
                                text: location,
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
                    // ignore: prefer_const_literals_to_create_immutables
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
          Payment(
              "Loại Phòng",
              "Phòng đơn",
              color_text1,
              color_text2,
              SizedBox(
                height: 0,
                width: 0,
              ),
              font_nor,
              context),
          SizedBox(width: 10),
          Payment(
              "Số người",
              "2 người lớn , 1 trẻ em",
              color_text1,
              color_text2,
              SizedBox(
                height: 0,
                width: 0,
              ),
              font_nor,
              context),
          SizedBox(width: 10),
          Payment(
              "Giá phòng",
              "799.000 vnđ",
              color_text1,
              color_text2,
              SizedBox(
                height: 0,
                width: 0,
              ),
              font_weight,
              context),
          SizedBox(width: 10),
          Payment(
              "Vị trí phòng",
              "Tòa B - Tầng 2 - Số Phòng 201",
              color_text1,
              Colors.brown,
              SizedBox(
                height: 0,
                width: 0,
              ),
              font_weight,
              context),
          SizedBox(width: 10),
          Payment(
              "Ngày Nhận Phòng",
              Date1,
              color_text1,
              color_bookingroom,
              SizedBox(
                height: 0,
                width: 0,
              ),
              font_weight,
              context),
          Payment(
              "Ngày Trả Phòng",
              date2,
              color_text1,
              color_bookingroom,
              SizedBox(
                height: 0,
                width: 0,
              ),
              font_weight,
              context),
          //Bill
          Payment("Tổng Thanh Toán", "4 450 000 VND", color_text1,
              color_payment, a, font_weight, context),
        ],
      ),
    ),
  );
}
