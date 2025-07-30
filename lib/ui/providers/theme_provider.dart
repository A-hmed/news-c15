import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var currentMode = ThemeMode.light;

  bool get isDarkMode => currentMode == ThemeMode.dark;

  void changeMode(ThemeMode mode) {
    currentMode = mode;
    notifyListeners();
  }
}
