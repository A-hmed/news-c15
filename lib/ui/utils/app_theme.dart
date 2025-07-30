import 'package:flutter/material.dart';
import 'package:news_c15/ui/utils/app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.white,
          primary: AppColors.white,
          secondary: AppColors.black),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500)),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.white,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black)),
    dividerTheme: DividerThemeData(
      color: AppColors.white,
    ));


  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.black,
          primary: AppColors.black,
          secondary: AppColors.white),
      textTheme: TextTheme(
          titleLarge: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500),
          titleSmall: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500),
          bodySmall: TextStyle(
              color: AppColors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500)),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.black,
          titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.white)));
}
