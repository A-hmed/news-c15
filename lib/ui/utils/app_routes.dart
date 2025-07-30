import 'package:flutter/material.dart';
import 'package:news_c15/ui/screens/home/home.dart';

abstract final class AppRoutes {
  static Route get home => MaterialPageRoute(builder: (_) => Home());
}
