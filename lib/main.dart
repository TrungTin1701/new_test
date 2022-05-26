// ignore_for_file: deprecated_member_use

import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'HotelPage/hotelcart.dart' show HotelCard;
import 'HomePage/homepage.dart';
import 'Profile/profile.dart';
import 'HotelPage/hotelcart.dart';
import 'package:flutter/cupertino.dart';

DateTime today = new DateTime.now();
String weekday =
    today.weekday < 7 ? 'Thứ ' + (today.weekday + 1).toString() : 'CN';
String min =
    today.minute < 10 ? '0' + today.minute.toString() : today.minute.toString();
late String dateSlug =
    "${weekday} /${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')},  ${today.hour}:${min}";
String _date1 = dateSlug.toString();
String weekday2 =
    today.weekday < 7 ? 'Thứ ' + (today.weekday + 4).toString() : 'CN';
late String dateSlug2 =
    "${weekday2} /${(today.year).toString()}-${today.month.toString().padLeft(2, '0')}-${(today.day + 3).toString().padLeft(2, '0')},  ${today.hour}:${min}";

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var materialApp = MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'TRAVEL HOLA',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Travel "),
      theme: ThemeData(fontFamily: 'Roboto1'),
      initialRoute: '/',
      routes: {
        '/profile': (context) => ProfileApp(),
        '/Home': (context) => StackOver(),
        '/Home1': (context) => Home1(),
      },
    );
    return materialApp;
  }
}

class StackOver extends StatefulWidget {
  @override
  _StackOverState createState() => _StackOverState();
}

class _StackOverState extends State<StackOver>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlatButton(
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Container(
                      color: Colors.white,
                      child: Center(
                          child: Text(
                        "Đặt phòng khác sạn",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      )),
                    ),
                    FlatButton(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                        ),
                      ),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                    ),
                  ],
                ),
              ),
              // give the tab bar a height [can change hheight to preferred height]
              Container(
                padding: EdgeInsets.only(top: 10),
                height: 40,
                color: Colors.white,
                child: TabBar(
                  controller: _tabController,

                  // give the indicator a decoration (color and border radius)
                  indicatorColor: Colors.blue,
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Color.fromARGB(255, 13, 10, 10),
                  labelColor: Colors.blue,
                  labelPadding: EdgeInsets.symmetric(horizontal: 15.0),
                  padding: const EdgeInsets.only(top: 0, bottom: 0),
                  labelStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black),
                  tabs: [
                    Tab(
                      child: Text(
                        "Tất Cả",
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Đang chờ phục vụ",
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Đang phục vụ",
                      ),
                    ),
                  ],
                ),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(controller: _tabController, children: [
                  Container(
                    padding: EdgeInsets.only(top: 0),
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          HotelCard('/image/hotel2.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel3.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel4.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel4.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          HotelCard('/image/hotel2.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel3.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel4.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel4.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    color: Color.fromARGB(255, 255, 255, 255),
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          HotelCard('/image/hotel2.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel3.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel4.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                          HotelCard('/image/hotel4.jpg', 'Tôi và em',
                              '400 Ung Van khiem', context, _date1, dateSlug2),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            titleSpacing: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: 30,
            title: Center(
                child: Text(
              "Booking Room",
              style: TextStyle(color: Colors.black, fontSize: 17),
            )),
            //centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black,
                iconSize: 17,
                onPressed: () {},
              )
            ],
            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 236, 232, 237),
                    Color.fromARGB(255, 227, 225, 225)
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              unselectedLabelColor: Color.fromARGB(255, 13, 10, 10),
              labelColor: Colors.blue,
              labelPadding: EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.only(top: 0, bottom: 0),
              labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),

              tabs: [
                Tab(text: 'Tất Cả'),
                Tab(text: 'Đang Phục Vụ'),
                Tab(text: 'Đang Chờ Phục Vụ'),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: TabBarView(children: [
                Container(
                  color: Color.fromARGB(255, 212, 209, 209),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        HotelCard('/image/hotel2.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel3.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel4.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel4.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 212, 209, 209),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        HotelCard('/image/hotel2.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel3.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel4.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel4.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 212, 209, 209),
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Container(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        HotelCard('/image/hotel2.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel3.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel4.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                        HotelCard('/image/hotel4.jpg', 'Tôi và em',
                            '400 Ung Van khiem', context, _date1, dateSlug2),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int select = 0;
  late TabController _tabController;
  @override
  // void initState() {
  //   _tabController = TabController(length: _widgetOptions.length, vsync: this);
  //   super.initState();
  // }

  static const List<Widget> _widgetOptions = <Widget>[
    Home1(),
    Home(),
    ProfileApp(),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();

    // var scaffold = MaterialApp(
    //     home: Scaffold(
    //   body: Center(child: _widgetOptions.elementAt(select)),
    //   bottomNavigationBar: BottomNavigationBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.hotel),
    //         label: 'Hotel',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(
    //           Icons.person,
    //         ),
    //         label: 'Profile',
    //       ),
    //     ],
    //     currentIndex: select,
    //     selectedItemColor: Colors.amber[800],
    //     onTap: (int index) {
    //       setState(() {
    //         select = index;
    //       });
    //     },
    //   ),
    // ));
    var scaffold = Scaffold(
      body: Center(child: _widgetOptions.elementAt(select)),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.hotel),
            label: 'Hotel',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: select,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                select = index;
              });
              break;
            case 1:
              Navigator.pushNamed(context, '/Home');
              break;
            case 2:
              setState(() {
                select = index;
              });
            // Navigator.pushNamed(context, '/Home');
          }
        },
      ),
    );
    return scaffold;
  }
}
