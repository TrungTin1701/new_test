// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CircleOptions extends StatefulWidget {
  const CircleOptions({Key? key}) : super(key: key);

  @override
  State<CircleOptions> createState() => _CircleOptionsState();
}

class _CircleOptionsState extends State<CircleOptions> {
  // Declare this variable
  late int selectedRadio;
  bool state = true;
  void checkstate() {
    if (state = false) {
      setState(() {
        selectedRadio = 7;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 7;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  Widget buildRadio(int val, String name) {
    return Expanded(
        child: Row(
      children: [
        Radio(
          value: val,
          groupValue: selectedRadio,
          onChanged: (val) {
            setSelectedRadio(val);
          },
        ),
        Text(name,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
      ],
    ));
  }

  Widget buildRadio1(int val1, int val2, String name, String name2) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [buildRadio(val1, name), buildRadio(val2, name2)]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildRadio1(1, 4, '1 Sao', '4 sao'),
      buildRadio1(2, 5, '2 Sao', '5 sao'),
      buildRadio1(3, 6, '3 Sao', 'Không đánh giá ')
    ]);
  }
}
