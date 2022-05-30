import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:new_test/Http_Users/Users.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostDetail extends StatelessWidget {
  final Person post;

  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.pinkAccent])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Info(
                        post: post,
                      ),
                      CartBio(),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Intro(
            post: post,
          ),
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

class ProfileApp extends StatelessWidget {
  final Person post;
  ProfileApp({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.pinkAccent])),
              child: Container(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Info(
                        post: post,
                      ),
                      CartBio(),
                    ],
                  ),
                ),
              )),
          SizedBox(
            height: 10.0,
          ),
          Intro(
            post: post,
          ),
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
class Info extends StatelessWidget {
  final Person post;
  Info({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            post.avatar,
          ),
          radius: 50.0,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            post.firstName,
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
                  Text(
                    "Follow",
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
class Intro extends StatelessWidget {
  final Person post;
  Intro({required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Center(
              child: Text(
                "Introduce Myself",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontStyle: FontStyle.normal,
                    fontSize: 28.0),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 100),
            child: Text(
              'My name is ' +
                  post.firstName +
                  " " +
                  post.lastName +
                  "  " +
                  ' and I am  a freelance mobile app developper.\n'
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
