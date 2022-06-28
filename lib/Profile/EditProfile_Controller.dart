// ignore_for_file: file_names, unnecessary_overrides

import 'package:get/get.dart';

class EditProfile extends GetxController {
  final name = "Marc Spector".obs;
  final introduction =
      'My name is Marc Spector and I am  a freelance mobile app developper.\n'
              'if you need any mobile app for your company then contact me for more informations'
          .obs;
  static EditProfile get to => Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  setname(String name) {
    this.name.value = name;
  }

  setInfo(String info) {
    introduction.value = info;
  }
}
