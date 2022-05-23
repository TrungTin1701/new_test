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
String weekday2 =
    today.weekday < 7 ? 'Thứ ' + (today.weekday + 4).toString() : 'CN';
late String dateSlug2 =
    "${weekday2} /${(today.year).toString()}-${today.month.toString().padLeft(2, '0')}-${(today.day + 3).toString().padLeft(2, '0')},  ${today.hour}:${min}";

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
      home: MyHomePage(title: ""),
      initialRoute: '/',
      routes: {
        '/profile': (context) => ProfileApp(),
        '/Home': (context) => Home(),
        '/Home1': (context) => Home1(),
      },
    );
    return materialApp;
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Booking Room")),
            //centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            ],
            //backgroundColor: Colors.purple,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.purple, Colors.red],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              //isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(text: 'Tất Cả'),
                Tab(text: 'Đang Phục Vụ'),
                Tab(text: 'Đang Chờ Phục Vụ'),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TabBarView(children: [
              Container(
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
          }
        },
      ),
    );
    return scaffold;
  }
}
