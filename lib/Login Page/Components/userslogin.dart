// ignore_for_file: deprecated_member_use, avoid_unnecessary_containers, prefer_const_constructors, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  var _opacity;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  //String newvalue = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height / 2.5,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          width: double.maxFinite,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'User Login',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 61, 78),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ]),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            onSaved: (newValue) => _emailController.text != newValue,
            controller: _emailController,
            decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 36, 21, 21)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 36, 21, 21)),
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 36, 21, 21).withOpacity(0.5),
                ),
                hintText: "Enter your email, number or username",
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                labelText: 'User Name',
                labelStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            obscureText: _obscureText ? false : true,
            controller: _passwordController,
            obscuringCharacter: '*',
            decoration: InputDecoration(
                suffixIcon: InkWell(
                  onTap: _toggle,
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 36, 21, 21)),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 36, 21, 21)),
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
          ),
        ),
        FlatButton(
            padding: EdgeInsets.all(0),
            onPressed: () => {
                  _opacity = _opacity == 0.5 ? 1.0 : 0.1,
                  print("hehehe" + _emailController.text),
                  print("hehehe" + _passwordController.text),
                  Navigator.pushNamed(context, '/')
                },
            child: Image.network(
              'image/button-one.png',
              color: Color.fromARGB(255, 237, 234, 234).withOpacity(0.9),
              colorBlendMode: BlendMode.modulate,
              fit: BoxFit.cover,
              opacity: _opacity,
            )),
      ]),
    );
  }
}
