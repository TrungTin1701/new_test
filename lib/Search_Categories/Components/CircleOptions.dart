// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CircleOptions extends StatefulWidget {
  const CircleOptions({Key? key}) : super(key: key);

  @override
  State<CircleOptions> createState() => _CircleOptionsState();
}

class _CircleOptionsState extends State<CircleOptions> {
  // Declare this variable
  late int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          ListTile(
            leading: Radio<int>(
              value: i,
              groupValue: selectedRadio,
              activeColor: Color.fromARGB(255, 62, 150, 222),
              onChanged: (int? val) {
                setSelectedRadio(val);
              },
            ),
            title: Text(
              ' $i sao',
            ),
          ),
        ListTile(
          leading: Radio<int>(
            value: 6,
            groupValue: selectedRadio,
            activeColor: Color.fromARGB(255, 62, 150, 222),
            onChanged: (int? val) {
              setSelectedRadio(val);
            },
          ),
          title: Text(
            'Không đánh giá',
          ),
        ),
      ],
    );
  }
}
