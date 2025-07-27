import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils%20/app_assets.dart';

class ThemeProvider extends ChangeNotifier {
  var themeMode = ThemeMode.dark;

  String get splash => themeMode == ThemeMode.light
      ? AppAssets.splashLight
      : AppAssets.splashDark;

  void changeTheme(ThemeMode newMode) {
    themeMode = newMode;
    notifyListeners();
  }
}
