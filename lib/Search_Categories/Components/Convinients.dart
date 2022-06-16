// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, camel_case_types, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget Convinients(String name) {
  return Column(
    children: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              child: Text(name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ),
        ],
      ),
      Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Divider(
          color: Color.fromARGB(255, 121, 115, 115),
          thickness: 1,
        ),
      ),
    ],
  );
}

class Button_Convinients extends StatefulWidget {
  late String name_button;
  Button_Convinients({required this.name_button, Key? key}) : super(key: key);

  @override
  State<Button_Convinients> createState() => _Button_ConvinientsState();
}

class _Button_ConvinientsState extends State<Button_Convinients> {
  var colorbutton = Colors.white;
  var colortext = Colors.black;

  @override
  void initState() {
    super.initState();
  }

  void _onPressed() {
    setState(() {
      if (colorbutton == Colors.white) {
        colorbutton = Color.fromARGB(255, 62, 150, 222);
        colortext = Colors.white;
      } else {
        colorbutton = Colors.white;
        colortext = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var name_button = widget.name_button;
    return Container(
      padding: EdgeInsets.only(right: 20),
      height: 40,
      width: MediaQuery.of(context).size.width / 3 - 10,
      alignment: Alignment.center,
      child: RaisedButton(
          focusColor: Colors.blueAccent,
          onPressed: () {
            _onPressed();
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          elevation: 0.0,
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              color: colorbutton,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text(
                name_button,
                style: TextStyle(
                    color: colortext,
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }
}

class ListButton extends StatelessWidget {
  List<String> button_name;
  ListButton({required this.button_name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        for (var i = 0; i < button_name.length; i++)
          Button_Convinients(name_button: button_name[i]),
      ],
    );
  }
}
