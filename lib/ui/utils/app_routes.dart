import 'package:flutter/material.dart';
import 'package:news_c15/ui/model/category_dm.dart';
import 'package:news_c15/ui/screens/home/home.dart';
import 'package:news_c15/ui/screens/news/news.dart';

abstract final class AppRoutes {
  static Route get home => MaterialPageRoute(builder: (_) => Home());

  static Route news(CategoryDM category) => MaterialPageRoute(builder: (_) => News(categoryDM: category,));
}
