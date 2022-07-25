// ignore_for_file: deprecated_member_use, unnecessary_brace_in_string_interps, prefer_const_constructors, duplicate_ignore, prefer_final_fields, non_constant_identifier_names, avoid_print

import 'dart:async';
import 'package:get/get.dart';
import 'package:new_test/Profile/EditProfile_Controller.dart';
import 'package:new_test/Profile/Editprofile_Screen.dart';
import 'package:new_test/provider/Marker_provider.dart';
import 'package:new_test/provider/changeapi.dart';
import 'Http_Users/List_Users.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_test/provider/font_provider.dart';
import 'package:provider/provider.dart';
import 'HomePage/homepage.dart';
import 'Map_Hotel/Map_Screen.dart';
import 'Profile/profile.dart';
import 'Search_Categories/Search_Screen.dart';
import 'Login Page/login_Page.dart';
import 'Screen/Screens.dart';

DateTime today = DateTime.now();
String weekday =
    today.weekday < 7 ? 'Thứ ' + (today.weekday + 1).toString() : 'CN';
String min =
    today.minute < 10 ? '0' + today.minute.toString() : today.minute.toString();
late String dateSlug =
    "${weekday} /${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')},  ${today.hour}:${min}";
String _date1 = dateSlug.toString();

String weekday3 =
    today.weekday + 3 < 7 ? 'Thứ ' + (today.weekday + 4).toString() : 'CN';
late String dateSlug2 =
    "${weekday3} /${(today.year).toString()}-${today.month.toString().padLeft(2, '0')}-${(today.day).toString().padLeft(2, '0')},  ${today.hour}:${min}";

void main() {
  int Case = 1;
  Get.put(EditProfile());
  switch (Case) {
    case 1:
      return runApp(MyApp());

    case 2:
      return runApp(
          DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
  }

  //
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final StreamController currentScreenObserver = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChangeLocation()),
        ChangeNotifierProvider(
          create: (_) => FontProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangeMarker(),
        ),
      ],
      child: Consumer<FontProvider>(
        builder: (context, value, child) => MaterialApp(
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'TRAVEL HOLA',
          debugShowCheckedModeBanner: false,
          home: MyHomePage(title: "Travel "),
          theme: ThemeData(fontFamily: value.fontFamily),
          initialRoute: '/map',
          routes: {
            '/profile': (context) => const ProfileApp(),
            '/Home': (context) => const StackOver(),
            '/Home1': (context) => const Home1(),
            '/Users': (context) => const Postpage(),
            '/Search': (context) => SearchScreen(),
            '/editprofile': (context) => EditProfileScreen(),
            '/loginpage': (context) => LoginPage(),
            '/map': (context) => const MapScreen(),
          },
        ),
      ),
    );
  }
}
