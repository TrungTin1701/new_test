// ignore_for_file: file_names, must_be_immutable, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonList extends StatefulWidget {
  const ButtonList({Key? key, this.onResetAll, this.onResult})
      : super(key: key);
  final VoidCallback? onResetAll;
  final VoidCallback? onResult;

  @override
  State<ButtonList> createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Button(
            button_name: "Thiêt lập lại",
            callback: widget.onResetAll,
          ),
          const SizedBox(width: 10),
          Button(button_name: "Hiển thị kết quả", callback: widget.onResult)
        ],
      ),
    );
  }
}

class Button extends StatefulWidget {
  String button_name;
  Button({required this.button_name, Key? key, this.callback})
      : super(key: key);
  final VoidCallback? callback;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    var buttonname = widget.button_name;
    return Expanded(
      child: OutlinedButton(
        onPressed: widget.callback,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          primary: Color.fromARGB(255, 215, 220, 224),
          backgroundColor: Color.fromARGB(255, 66, 161, 238),
          side: const BorderSide(
            color: Colors.blue,
            width: 1,
          ),
        ),
        child: Text(
          buttonname,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
