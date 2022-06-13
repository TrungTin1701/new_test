// ignore_for_file: prefer_const_constructors, file_names, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:new_test/HomePage/homepage.dart';
import 'package:new_test/Search_Categories/Components/Convinients.dart';
import 'package:new_test/Search_Categories/Components/CircleOptions.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  List<String> button_name = ['Wifi miễn phí', 'Massage/Spa', 'Hồ Bơi'];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 50, right: 10),
      child: Scaffold(
        body: ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Convinients('Hạng sao'),
                  Container(child: CircleOptions()),
                  Convinients('Tiện nghi'),
                  ListButton(
                    button_name: ['Wifi miễn phí', 'Massage/Spa', 'Hồ Bơi'],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                  ),
                  ListButton(
                    button_name: [
                      'Bãi đỗ xe',
                      'Vui chơi giải trí',
                      'Thuê xe máy'
                    ],
                  ),
                ]),
          ],
        ),
      ),
    );
  }
}
