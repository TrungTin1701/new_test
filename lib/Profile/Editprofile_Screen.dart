// ignore_for_file: file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'EditProfile_Controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final resname = EditProfile.to;
  String temp = "";
  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('Edit Profile'),
          backgroundColor: Colors.redAccent,
        ),
        body: Obx(
          () => Center(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  onSubmitted: (value) {
                    resname.setname(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: resname.name.value,
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: ConstrainedBox(
                    constraints: BoxConstraints.tightFor(height: 100),
                    child: Obx(
                      () => TextField(
                        controller: TextEditingController(
                            text: resname.introduction.value),
                        onSubmitted: (value) {
                          resname.setInfo(value);
                        },
                        decoration: InputDecoration(
                          labelText: 'Introduction Youself',
                          hintText: resname.introduction.value,
                          labelStyle: TextStyle(fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
