// ignore_for_file: file_names, unnecessary_import, prefer_const_constructors_in_immutables, non_constant_identifier_names, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:new_test/HomePage/homepage.dart';

class BatteryLevel extends StatefulWidget {
  BatteryLevel({Key? key}) : super(key: key);
  static const platform = MethodChannel("com.example.new_test1");
  static const platform2 = MethodChannel("newactivity");
  static const _evanchannel = EventChannel("com.example.new_test");

  @override
  State<BatteryLevel> createState() => _BatteryLevelState();
}

class _BatteryLevelState extends State<BatteryLevel> {
  String _Battery_now = " Waiting...";
  String Intro2 = "Press Here to get info Battery from Native";

  // ignore: annotate_overrides
  void initState() {
    super.initState();
    BatteryLevel._evanchannel.receiveBroadcastStream().listen(onIntroNow);
  }

  onIntroNow(event) {
    setState(() {
      Intro2 = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(children: <Widget>[
              Icon(
                Icons.battery_full,
                color: kPrimaryColor,
              ),
              VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              Expanded(
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "Search for Hotel, City, Area",
                    hintStyle: TextStyle(
                      color: kPrimaryColor.withOpacity(0.5),
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Text(Intro2),
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
    String Battery_now = "No massage";

    final int result = await BatteryLevel.platform.invokeMethod('GetBattery',
        <String, String>{'BTN': 'Hehe', 'name': "Em met moi qua!!"});
    Battery_now = "$result '%";
    setState(() {
      _Battery_now = Battery_now;
    });
  }
}
