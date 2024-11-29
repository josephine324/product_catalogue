// lib/theme.dart

import 'package:flutter/material.dart';

class MyThemes {
  // Light Theme
  static final ThemeData light = ThemeData(
    primaryColor: Colors.blue,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
    ),
  );

  // Dark Theme
  static final ThemeData dark = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
    ),
  );
}
