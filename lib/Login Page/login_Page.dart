// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:new_test/Login%20Page/Components/userslogin.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('/image/welcome-one.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: UserLogin(),
      ),
    );
  }
}
