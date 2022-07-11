// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, avoid_print

import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:new_test/Map_Hotel/Components/CustomMaker/MyPaint.dart';
import 'package:new_test/Map_Hotel/Components/HotelCard/HotelCard.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_test/provider/changeapi.dart';
import 'package:provider/provider.dart';

List<Marker> _list = const [
  Marker(
    zIndex: 0,
    markerId: MarkerId('1'),
    position: LatLng(37.42830266604936, -122.09190431982279),
  ),
  Marker(
    zIndex: 0,
    markerId: MarkerId('2'),
    position: LatLng(37.429816002294984, -122.09238041192293),
  ),
  Marker(
      markerId: MarkerId('3'),
      position: LatLng(37.43397778545293, -122.08606280386448)),
  Marker(
      zIndex: 0,
      markerId: MarkerId('4'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(title: 'a')),
  Marker(
      zIndex: 0,
      markerId: MarkerId('5'),
      position: LatLng(37.43231091684314, -122.0917095243931),
      infoWindow: InfoWindow(title: "hehe")),
  Marker(
      zIndex: 0,
      markerId: MarkerId('6'),
      position: LatLng(37.42796133580664, -122.089),
      infoWindow: InfoWindow(title: 'b')),
];

class MapBody extends StatefulWidget {
  const MapBody({Key? key}) : super(key: key);

  @override
  State<MapBody> createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  // Load Custom Marker
  Future<Uint8List?> _myPainterToMap(String Label, Color color) async {
    ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final canvas = ui.Canvas(pictureRecorder);
    MyPainter myPainter = MyPainter(Label, color);
    myPainter.paint(canvas, Size(300, 100));
    final ui.Image picture =
        await pictureRecorder.endRecording().toImage(300, 100);
    final ByteData? byteData =
        await picture.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  // Load List Data
  Set<Marker> _markers = {};
  Set<Marker> temp = {};

  Future<Set<Marker>> _loadListMarkers(List<Marker> listtemp) async {
    var newlist = listtemp;
    _markers.clear();
    int index1 = 0;
    int index2 = 0;
    var bytes = await _myPainterToMap("4.500.000", Colors.white);
    var bytes1 = await _myPainterToMap("4.500.000", Colors.blue);

    int count = 0;
    for (var i in newlist) {
      Marker marker = Marker(
          zIndex: index2++ == 0 ? 1 : 0,
          markerId: i.markerId,
          position: i.position,
          infoWindow: InfoWindow(title: "${count++}"),
          icon: BitmapDescriptor.fromBytes(index1++ == 0 ? bytes1! : bytes!),
          onTap: () {
            final index =
                newlist.indexWhere((element) => element.markerId == i.markerId);

            print("hhahahaha3312312 => $index");

            try {
              newlist = List.of(newlist)
                ..insert(0, newlist[index].copyWith())
                ..removeAt(index + 1);
            } catch (e) {
              print('hahahahahahaha => ${e}');
            }

            setState(() {
              print("hehe");
              _loadListMarkers(newlist);
            });
          });
      setState(() {
        _markers.add(marker);
      });
    }
    return _markers;
  }

  // Set in InitState
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    //_loadListMarkers();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _loadListMarkers(_list);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Consumer<ChangeLocation>(builder: ((context, value, child) {
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Color.fromARGB(255, 7, 7, 7),
          child: GoogleMap(
            key: UniqueKey(),
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController controller) {
              setState(() {
                _controller.complete(controller);
              });
            },
            markers: Set<Marker>.from(_markers),
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition: value.kGooglePlex1,
            onTap: (position) => {print(position)},
          ),
        );
      })),
      Positioned(
        // child: Container(
        //     width: MediaQuery.of(context).size.width * 0.8,
        //     height: MediaQuery.of(context).size.height * 0.45,
        //     child: HotelCard()),
        child: Container(
          height: MediaQuery.of(context).size.height / 2 * 0.4,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(3.0, 5.0), // changes position of shadow
                )
              ]),
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 4,
            ),
            items: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: HotelCard()),
            ],
          ),
        ),
        bottom: MediaQuery.of(context).size.height / 10,
        left: MediaQuery.of(context).size.width * 0.1,
      ),
    ]);
  }
}
