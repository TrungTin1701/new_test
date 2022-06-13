// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class MainProfile extends StatefulWidget {
//   const MainProfile({Key? key}) : super(key: key);

//   @override
//   State<MainProfile> createState() => MainProfileState();
// }

// class MainProfileState extends State<MainProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.arrow_back),
//         title: const Text("PROFILE"),
//         centerTitle: true,
//         actions: const [Icon(Icons.more_vert)],
//         backgroundColor: Color.fromARGB(255, 59, 160, 175),
//       ),
//       body: SafeArea(
//           child: Column(
//         children: [
//           Profilehead(),
//           Container(
//             height: 200,
//             color: Colors.red,
//           ),
//           Expanded(
//             child: Container(
//               height: 200,
//             ),
//           ),
//         ],
//       )),
//     );
//   }
// }

// class Profilehead extends StatefulWidget {
//   const Profilehead({Key? key}) : super(key: key);

//   @override
//   State<Profilehead> createState() => _ProfileheadState();
// }

// ignore_for_file: deprecated_member_use, prefer_const_constructors, prefer_const_literals_to_create_immutables

// class _ProfileheadState extends State<Profilehead> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               child: CircleAvatar(
//                 radius: 40,
//                 backgroundImage: NetworkImage('/image/hotel1.jpg'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
//               child: Text(
//                 "Nguyen Trung Tin",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 47, 108, 119)),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:new_test/Profile/Components/Info.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("PROFILE"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.pinkAccent])),
              child: SizedBox(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Info(),
                      CartBio(),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          UI(),
          SizedBox(
            height: 10.0,
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/Users");
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.orangeAccent, Colors.pinkAccent]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "List Friends",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
