import 'package:flutter/material.dart';
import 'package:myflutterproject/Helper/ConstsData.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey,
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
    ),
    colorScheme: const ColorScheme.light(
        background: Colors.transparent,
        primary: Colors.blueGrey,
        onPrimary: Color.fromARGB(255, 138, 67, 0),
        secondary: Colors.white,
        onSecondary: Colors.black));
