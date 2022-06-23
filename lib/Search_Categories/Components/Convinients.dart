// ignore_for_file: file_names, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, camel_case_types, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

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
  Button_Convinients(
      {required this.name_button,
      Key? key,
      this.onPressed,
      this.unSelected,
      this.isSelected = false})
      : super(key: key);
  final Function(String)? onPressed;
  final Function(String)? unSelected;
  final bool isSelected;

  @override
  State<Button_Convinients> createState() => _Button_ConvinientsState();
}

class _Button_ConvinientsState extends State<Button_Convinients> {
  @override
  void initState() {
    super.initState();
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
          focusColor: Colors.lightBlue.shade500,
          onPressed: () => widget.isSelected
              ? widget.unSelected?.call(widget.name_button)
              : widget.onPressed?.call(widget.name_button),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          elevation: 0.0,
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
              color:
                  widget.isSelected ? Colors.lightBlue.shade500 : Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Text(
                name_button,
                style: TextStyle(
                    color: widget.isSelected ? Colors.white : Colors.black,
                    textBaseline: TextBaseline.alphabetic,
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )),
    );
  }
}

class ListButton extends StatefulWidget {
  ListButton({Key? key, this.list_button = const [], this.on_pressedButton})
      : super(key: key);
  final List<String>? list_button;
  final Function(List<String>)? on_pressedButton;

  @override
  State<ListButton> createState() => _ListButtonState();
}

class _ListButtonState extends State<ListButton> {
  List<String> button_name = [
    'Wifi miễn phí',
    'Massage/Spa',
    'Hồ Bơi',
    'Bãi đỗ xe',
    'Vui chơi giải trí',
    'Thuê xe máy',
  ];

  void handleClickConvenient(String value, {required bool isAdd}) =>
      setState(() {
        if (isAdd) {
          widget.list_button?.add(value);
        } else {
          {
            widget.list_button?.remove(value);
          }
        }

        widget.on_pressedButton?.call(widget.list_button ?? []);
      });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: [
        for (var i = 0; i < button_name.length; i++)
          Button_Convinients(
              name_button: button_name[i],
              isSelected: widget.list_button?.contains(button_name[i]) ?? false,
              onPressed: (name) => handleClickConvenient(name, isAdd: true),
              unSelected: (name) => handleClickConvenient(name, isAdd: false)),
      ],
    );
  }
}


// Widget Convinients(String name) {
//   return Column(
//     children: [
//       Row(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 10),
//             child: SizedBox(
//               child: Text(name,
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black)),
//             ),
//           ),
//         ],
//       ),
//       Padding(
//         padding: EdgeInsets.only(bottom: 10),
//         child: Divider(
//           color: Color.fromARGB(255, 121, 115, 115),
//           thickness: 1,
//         ),
//       ),
//     ],
//   );
// }

// class Button_Convinients extends StatefulWidget {
//   const Button_Convinients({Key? key, this.name_button}) : super(key: key);
//   final String? name_button;
//   @override
//   State<Button_Convinients> createState() => _Button_ConvinientsState();
// }

// class _Button_ConvinientsState extends State<Button_Convinients> {
//   var colorbutton = Colors.white;
//   var colortext = Colors.black;
//   List<String> button_name = [
//     'Wifi miễn phí',
//     'Massage/Spa',
//     'Hồ Bơi',
//     'Bãi đỗ xe',
//     'Vui chơi giải trí',
//     'Thuê xe máy',
//   ];
//   @override
//   void initState() {
//     super.initState();
//   }

//   void _onPressed() {
//     this.setState(() {
//       if (colorbutton == Colors.white) {
//         colorbutton = Color.fromARGB(255, 62, 150, 222);
//         colortext = Colors.white;
//       } else {
//         colorbutton = Colors.white;
//         colortext = Colors.black;
//       }
//     });
//   }

//   Widget buildbutton(name_button) {
//     return Container(
//       padding: EdgeInsets.only(right: 20),
//       height: 40,
//       width: MediaQuery.of(context).size.width / 3 - 10,
//       alignment: Alignment.center,
//       child: RaisedButton(
//           focusColor: Colors.blueAccent,
//           onPressed: () {
//             _onPressed();
//           },
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
//           elevation: 0.0,
//           padding: EdgeInsets.all(0.0),
//           child: Ink(
//             decoration: BoxDecoration(
//               color: colorbutton,
//               borderRadius: BorderRadius.circular(30.0),
//             ),
//             child: Container(
//               padding: EdgeInsets.all(5.0),
//               alignment: Alignment.center,
//               child: Text(
//                 name_button,
//                 style: TextStyle(
//                     color: colortext,
//                     textBaseline: TextBaseline.alphabetic,
//                     fontSize: 13,
//                     fontWeight: FontWeight.w500),
//               ),
//             ),
//           )),
//     );
//   }

//   Widget build(BuildContext context) {
//     return Wrap(
//       spacing: 5,
//       runSpacing: 10,
//       children: [
//         for (var i = 0; i < button_name.length; i++)
//           buildbutton(button_name[i]),
//       ],
//     );
//   }
// }
