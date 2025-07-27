import 'package:flutter/material.dart';
import 'package:news_c15/ui/screens/home/home.dart';
import 'package:news_c15/ui/screens/splash/splash.dart';

abstract final class AppRoutes {
  static Route get splash => MaterialPageRoute(builder: (_) => Splash());

  static Route get home => MaterialPageRoute(builder: (_) => Home());
}
