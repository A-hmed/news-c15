import 'package:flutter/material.dart';
import 'package:news_c15/ui/providers/theme_provider.dart';
import 'package:news_c15/ui/screens/home/home.dart';
import 'package:news_c15/ui/screens/splash/splash.dart';
import 'package:news_c15/ui/utils%20/app_theme.dart';
import 'package:news_c15/ui/utils%20/extensions/build_context_extensions.dart';
import 'package:provider/provider.dart';

void main() {
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
