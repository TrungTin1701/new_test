// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class BatteryLevel extends StatefulWidget {
  BatteryLevel({Key? key}) : super(key: key);
  static const platform = MethodChannel("com.example.new_test");
  static const platform2 = MethodChannel("newactivity");

  @override
  State<BatteryLevel> createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  String _Battery_now = " Waiting...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Press Here to get info from Native"),
          ElevatedButton(
              onPressed: () => {_ShowBattery()}, child: Text("Click Me !!!")),
          Text(
            _Battery_now,
            style: TextStyle(color: Colors.redAccent, fontSize: 20),
          )
        ],
      )),
    );
  }

  Future<void> SecondActivity() async {
    await BatteryLevel.platform2.invokeMethod('NewActivity');
  }

  Future<void> _ShowBattery() async {
    String Battery_now;

    final int result = await BatteryLevel.platform.invokeMethod('GetBattery',
        <String, String>{'BTN': 'Hehe', 'name': "Em met moi qua!!"});
    Battery_now = "$result '%";
    setState(() {
      _Battery_now = Battery_now;
    });
  }
}
