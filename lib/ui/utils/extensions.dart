import 'package:flutter/material.dart';
import 'package:news_c15/ui/providers/theme_provider.dart';
import 'package:provider/provider.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get themeData => Theme.of(this);

  Color get primary => themeData.colorScheme.primary;

  Color get secondary => themeData.colorScheme.secondary;

  TextTheme get textTheme => themeData.textTheme;

  ThemeProvider get themeProvider => Provider.of(this, listen: false);

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;
}
