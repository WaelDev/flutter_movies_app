import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.orange,
    secondaryHeaderColor: Colors.grey[50],
    splashColor: Colors.white10,
    colorScheme: const ColorScheme.light().copyWith(primary: Colors.red),
  ),
  AppTheme.dark: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.grey.shade900,
    brightness: Brightness.dark,
    primaryColor: Colors.red[900],
    secondaryHeaderColor: Colors.grey[850],
    splashColor: Colors.white10,
    indicatorColor: Colors.red,
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: Colors.red,
    ),
  ),
};
