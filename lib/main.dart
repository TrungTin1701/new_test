import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'HotelPage/hotelcart.dart' show HotelCard;
import 'HomePage/homepage.dart';
import 'Profile/profile.dart';
import 'HotelPage/hotelcart.dart';

DateTime today = new DateTime.now();
String weekday =
    today.weekday < 7 ? 'Thứ ' + (today.weekday + 1).toString() : 'CN';
String min =
    today.minute < 10 ? '0' + today.minute.toString() : today.minute.toString();
late String dateSlug =
    "${weekday} /${today.year.toString()}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')},  ${today.hour}:${min}";
String _date1 = dateSlug.toString();
late String dateSlug2 =
    "${weekday} /${(today.year).toString()}-${today.month.toString().padLeft(2, '0')}-${(today.day + 3).toString().padLeft(2, '0')},  ${today.hour}:${min}";

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeData = ThemeData();
    var materialApp = MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'TRAVEL HOLA',
      theme: themeData,
      home: const MyHomePage(title: 'TRAVEL HOLA'),
    );
    return materialApp;
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            //Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyApp()));
            print(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text("BOOKING HOTEL ROOM"),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert)],
        backgroundColor: Color.fromARGB(255, 59, 160, 175),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DefaultTabController(
              length: 3,
              child: Expanded(
                  child: Column(
                children: [
                  Flexible(
                    child: Builder(builder: (context) {
                      return TabBar(
                          indicatorColor: Colors.blue,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorWeight: 4,
                          unselectedLabelColor: Color.fromARGB(255, 13, 10, 10),
                          labelColor: Colors.blue,
                          padding: const EdgeInsets.only(top: 0, bottom: 0),
                          labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                          tabs: [
                            Tab(
                              text: "Tất cả",
                            ),
                            Tab(
                              text: "Đang chờ phục vụ",
                            ),
                            Tab(
                              text: "Đang phục vụ",
                            )
                          ]);
                    }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: TabBarView(children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.60,
                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              HotelCard(
                                  '/image/hotel2.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              HotelCard(
                                  '/image/hotel3.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              HotelCard(
                                  '/image/hotel4.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              HotelCard(
                                  '/image/hotel4.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              HotelCard(
                                  '/image/hotel2.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              HotelCard(
                                  '/image/hotel3.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              HotelCard(
                                  '/image/hotel4.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Container(
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              HotelCard(
                                  '/image/hotel2.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              // ignore: prefer_const_constructors
                              HotelCard(
                                  '/image/hotel3.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                              HotelCard(
                                  '/image/hotel4.jpg',
                                  'Tôi và em',
                                  '400 Ung Van khiem',
                                  context,
                                  _date1,
                                  dateSlug2),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  )
                ],
              )))
        ],
      ),
    );
  }
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
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

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
        onTap: (int index) {
          setState(() {
            select = index;
          });
        },
      ),
    );
    return scaffold;
  }
}
