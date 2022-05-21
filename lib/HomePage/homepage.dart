import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
// ignore: implementation_imports

class Home1 extends StatefulWidget {
  const Home1({Key? key}) : super(key: key);

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final mycontroller = TextEditingController();
  @override
  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text("HOME PAGE"),
          centerTitle: true,
          actions: const [Icon(Icons.more_vert)],
          backgroundColor: const Color.fromARGB(255, 59, 160, 175),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const image_1(), //Picture roll
              Container(
                color: Colors.white,
                height: 50,
                child: Material(
                  elevation: 10.0,
                  borderRadius: BorderRadius.circular(40.0),
                  shadowColor: const Color.fromARGB(84, 44, 41, 41),
                  child: TextField(
                    controller: mycontroller,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      hintText: "Search for Hotel, Flight...",
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(137, 121, 67, 67),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Center(
                child: FloatingActionButton(
                    onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(mycontroller.text),
                                  contentPadding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 10, bottom: 10),
                                );
                              }),
                        },
                    child: const Icon(Icons.search)),
              ),
              const image_1(), //Search
            ],
          ),
        ));
  }
}

class image_1 extends StatefulWidget {
  const image_1({Key? key}) : super(key: key);

  @override
  State<image_1> createState() => _image_1State();
}

class _image_1State extends State<image_1> {
  late List<Widget> imageroll = [
    travelCard(
      '/image/hotel2.jpg',
      'Park Hyatt',
      'Le Thanh Ton , District 1 , HCM',
      3,
    ),
    travelCard(
      '/image/hotel3.jpg',
      'Park Hyatt',
      'Le Thanh Ton , District 1 , HCM',
      4,
    ),
    travelCard(
      '/image/hotel4.jpg',
      'Park Hyatt',
      'Le Thanh Ton , District 1 , HCM',
      4,
    ),
    travelCard(
      '/image/hotel4.jpg',
      'Park Hyatt',
      'Le Thanh Ton , District 1 , HCM',
      4,
    ),
    travelCard(
      '/image/hotel1.jpg',
      'Park Hyatt',
      'Le Thanh Ton , District 1 , HCM',
      4,
    ),
  ];
  late PageController _pageController;
  int activePage = 0;

  late Timer timer;
  late Duration autoplayDuration = const Duration(seconds: 3);
  late Duration animationDuration = const Duration(seconds: 2);
  late Duration backDuration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.99, initialPage: 0);

    WidgetsBinding.instance?.addPostFrameCallback(
        (_) => timer = Timer.periodic(autoplayDuration, (timer) {
              var length = (imageroll.length) - 1;
              if (_pageController.hasClients) {
                if ((_pageController.page?.round()) == length) {
                  _pageController.animateToPage(0,
                      duration: backDuration, curve: Curves.easeInOut);
                } else {
                  _pageController.nextPage(
                      duration: animationDuration, curve: Curves.easeInOut);
                }
              }
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: imageroll.length,
        itemBuilder: (BuildContext context, int index) {
          return imageroll[index];
        },
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            activePage = index;
          });
        },
      ),
    );
  }

  Widget travelCard(
      String imgUrl, String hotelName, String location, int rating) {
    return Builder(builder: (context) {
      return Card(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 0.0,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(imgUrl),
              fit: BoxFit.cover,
            )),
            width: MediaQuery.of(context).size.width - 22,
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      for (var i = 0; i < rating; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Icon(
                            Icons.star,
                            color: Color.fromARGB(255, 235, 221, 102),
                          ),
                        ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, right: 0),
                        child: Text(
                          hotelName,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 196, 235, 238)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          location,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 166, 201, 207)),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
