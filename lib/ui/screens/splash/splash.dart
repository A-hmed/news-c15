import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils/app_assets.dart';
import 'package:news_c15/ui/utils/app_routes.dart';
import 'package:news_c15/ui/utils/extensions.dart';
import 'package:news_c15/ui/widgets/app_scaffold.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
       Navigator.push(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(context.themeProvider.isDarkMode
          ? AppAssets.splashDark
          : AppAssets.splashLight),
    );
  }
}
