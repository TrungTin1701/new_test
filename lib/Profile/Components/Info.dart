//Avar Cart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';

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
              'My name is Marc Spector and I am  a freelance mobile app developper.\n'
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
