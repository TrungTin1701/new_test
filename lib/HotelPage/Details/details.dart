import 'package:flutter/material.dart';
import '/HotelPage/Details/HotelCartExtended.dart';
import 'package:new_test/main.dart';

// ignore: camel_case_types
class chitiet extends StatefulWidget {
  const chitiet({Key? key}) : super(key: key);

  @override
  State<chitiet> createState() => _chitietState();
}

// ignore: camel_case_types
class _chitietState extends State<chitiet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text("BOOKING HOTEL ROOM"),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
        backgroundColor: const Color.fromARGB(255, 59, 160, 175),
      ),
      body: Column(
        children: [
          HotelCard1(
              '/image/hotel2.jpg', 'Dat lat pho', '400 Ung Van khiem', context)
        ],
      ),
    );
  }
}
