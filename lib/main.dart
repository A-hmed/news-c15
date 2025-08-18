import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_c15/data/utils/hive_adapter/source_adapter.dart';
import 'package:news_c15/di/configure_dependcies.dart';
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
  Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  configureDependcies();
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
      home: Home(),
    );
  }
}
// Ui -> Widgets - ViewModels
// Data -> Repositories - Data Sources
// Domain(Business Layer - Indpendent Layer) ->  UseCases - models
// Widget -> ViewModel -> UseCase -> Repository -> DataSource
