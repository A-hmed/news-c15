import 'package:flutter/material.dart';
import 'package:news_c15/ui/providers/theme_provider.dart';
import 'package:news_c15/ui/screens/home/home.dart';
import 'package:news_c15/ui/screens/news/news.dart';
import 'package:news_c15/ui/utils/app_theme.dart';
import 'package:provider/provider.dart';

/// HTTP REQUEST=>
/// Link => Baseurl/EndPointName?QueryParameters
/// TYPES => GET - POST - DELETE - PUT - PATCH
/// Get has no body
/// Post contains body
/// Body-> json
/// Headers-> json
///
/// -----
/// Response
/// status code(int)
/// body

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeProvider = Provider.of(context);
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.currentMode,
      home: News(),
    );
  }
}
