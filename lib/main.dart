import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:news_c15/data/model/source_response.dart';
import 'package:news_c15/data/utils/hive_adapter/source_adapter.dart';
import 'package:news_c15/di/get_it_modules.dart';
import 'package:news_c15/ui/providers/theme_provider.dart';
import 'package:news_c15/ui/screens/home/home.dart';
import 'package:news_c15/ui/screens/news/news.dart';
import 'package:news_c15/ui/screens/news/news_view_model.dart';
import 'package:news_c15/ui/utils%20/app_theme.dart';
import 'package:provider/provider.dart';
///Json -> Java Script Object Notation
/// {key(String): value(dynamic)}
/// Request =>
/// Types of requests => GET - POST (PATCH - PUT - DELETE )
/// Link => BaseUrl/EndPoint?QueryParameters
/// RequestBody => html - json - xml
/// Headers => Json
///
/// Response
/// Status code -> 20x - 40x - 50x
/// Response Body => html - json - xml
/// Headers => json
void main() {
  Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  configureDependcies();
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeProvider themeProvider;

  // This widget is the root of your application.

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
      themeMode: themeProvider.themeMode,
      home: Home(),
    );
  }
}

/// Ui-> Widgets - Vm
/// Data -> Repositories -> Data sources - Api Data Models - Mappers
/// Domain(Optional) = Business layer = Independent layer -> UseCases - Domain Model - Repositories
///Widget -> VM(State Holder) -> Usecase -> Repository - Data source(Remote - Local)
