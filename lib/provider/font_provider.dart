import 'package:flutter/foundation.dart';

class FontProvider with ChangeNotifier {
  String fontFamily = "";

  void changeFont(String fontFamily) {
    this.fontFamily = fontFamily;
    notifyListeners();
  }
}
