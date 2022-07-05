// ignore_for_file: file_names, override_on_non_overriding_member, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/LocationIcon.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/StartRate.dart';
import 'package:new_test/Map_Hotel/Components/Button.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);
  @override
  Widget buildRow(Widget a, Widget b, BuildContext context, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          a,
          SizedBox(
            width: size,
          ),
          b,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 5, top: 5),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextInput(
            text: "Intercontinental Hotel",
            size: 17,
            isBold: true,
            isLinethroug: false,
          ),
          buildRow(
              StarRate(size: 16, rate: 4),
              TextInput(
                text: "Khách sạn",
                size: 15,
                isBold: false,
                isLinethroug: false,
              ),
              context,
              MediaQuery.of(context).size.width * 0.04),
          buildRow(
              LocationIcon(),
              TextInput(
                text: "Mai Anh Tuấn , Ba Đình ,Hà Nội",
                size: 15,
                isBold: false,
                isLinethroug: false,
              ),
              context,
              MediaQuery.of(context).size.width * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextInput(
                  text: "2 Phòng/4 Đêm",
                  size: 13,
                  isBold: false,
                  isLinethroug: false),
              TextInput(
                  text: "8.000.000đ",
                  size: 13,
                  isBold: false,
                  isLinethroug: true),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('7.500.000',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 193, 16, 16),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Button(),
        ],
      ),
    );
  }
}

class TextInput extends StatelessWidget {
  String text;
  double size;
  var isBold = false;
  var isLinethroug = false;
  TextInput(
      {Key? key,
      required this.text,
      required this.size,
      required this.isBold,
      required this.isLinethroug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        fit: FlexFit.loose,
        child: Text(
          text,
          maxLines: 1,
          style: TextStyle(
              fontSize: size,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.black,
              decoration: isLinethroug
                  ? TextDecoration.lineThrough
                  : TextDecoration.none),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
