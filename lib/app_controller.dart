import 'package:flutter/cupertino.dart';

// gerencia de estado
class AppController extends ChangeNotifier {

  static AppController instance = AppController();

  bool isDartTheme = false;
  changeTheme() {
    isDartTheme = !isDartTheme;
    notifyListeners();
  }
}
