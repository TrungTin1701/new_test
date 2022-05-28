import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class FontProvider with ChangeNotifier {
  String fontFamily = "";

  void changeFont(String fontFamily) {
    this.fontFamily = fontFamily;
    notifyListeners();
  }
}
