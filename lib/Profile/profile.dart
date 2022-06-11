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

class ProfileApp extends StatelessWidget {
  const ProfileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text("PROFILE"),
        centerTitle: true,
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

//Avar Cart
class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "/image/Avar/marc.jpg",
          ),
          radius: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Marc Spector",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

//BioCart
class CartBio extends StatefulWidget {
  const CartBio({Key? key}) : super(key: key);

  @override
  State<CartBio> createState() => _CartBioState();
}

class _CartBioState extends State<CartBio> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      clipBehavior: Clip.antiAlias,
      color: Colors.white,
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Posts",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "5200",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.pinkAccent,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    "Followers",
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "28.5K",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.pinkAccent,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  const Text(
                    "Follow",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  const Text(
                    "1300",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.pinkAccent,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Introduction
class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: Text(
              "Introduce Myself",
              style: TextStyle(
                  color: Colors.redAccent,
                  fontStyle: FontStyle.normal,
                  fontSize: 28.0),
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 100),
            child: const Text(
              'My name is Macr Spector and I am  a freelance mobile app developper.\n'
              'if you need any mobile app for your company then contact me for more informations',
              style: TextStyle(
                fontSize: 17.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
