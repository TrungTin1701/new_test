// ignore_for_file: prefer_const_constructors, file_names, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, must_be_immutable, sized_box_for_whitespace, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:new_test/HomePage/homepage.dart';
import 'package:new_test/Search_Categories/Components/Convinients.dart';
import 'package:new_test/Search_Categories/Components/CircleOptions.dart';
import 'Components/price.dart';
import 'Components/Button.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key, this.prices, this.star, this.convenients = const []})
      : super(key: key);

  final RangeValues? prices;
  final int? star;
  final List<String> convenients;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RangeValues? prices;
  int? star;
  List<String> convenients = [];

  @override
  void initState() {
    prices = widget.prices;
    star = widget.star;
    convenients = widget.convenients;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.only(left: 10, top: 20, right: 10),
      child: body(context),
    );
  }

  Widget body(BuildContext context) => Scaffold(
        body: ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      'Bộ lọc',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  Convinients("Theo mức giá"),
                  Container(
                    height: 150,
                    child: Wrap(
                      children: [PriceSlider()],
                    ),
                  ),
                  Convinients('Hạng sao'),
                  Container(
                      child: CircleOptions(
                    selectedStar: star,
                    onSelectedStar: (value) {
                      star = value;
                    },
                  )),
                  SizedBox(height: 20),
                  Convinients('Tiện nghi'),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     ListButton(
                  //       button_name: ['Wifi miễn phí', 'Massage/Spa', 'Hồ Bơi'],
                  //     ),
                  //     SizedBox(
                  //       height: 10,
                  //     ),
                  //     ListButton(
                  //       button_name: [
                  //         'Bãi đỗ xe',
                  //         'Vui chơi giải trí',
                  //         'Thuê xe máy'
                  //       ],
                  //     ),
                  //     ButtonList()
                  //   ],
                  // )
                  ListButton(
                    button_name: [
                      'Wifi miễn phí',
                      'Massage/Spa',
                      'Hồ Bơi',
                      'Bãi đỗ xe',
                      'Vui chơi giải trí',
                      'Thuê xe máy'
                    ],
                  ),
                  ButtonList(
                    onResult: () => Navigator.of(context).pop(star),
                  )
                ]),
          ],
        ),
      );
}
