import 'package:flutter/foundation.dart';

class ApiProivder with ChangeNotifier {
  String apiurl = "";

  void changeApi(String fontFamily) {
    this.apiurl = fontFamily;
    notifyListeners();
  }
}
