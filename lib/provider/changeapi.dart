import 'package:flutter/foundation.dart';

class ApiProivder with ChangeNotifier {
  String apiurl = "";

  void changeApi(String fontFamily) {
    apiurl = fontFamily;
    notifyListeners();
  }
}
