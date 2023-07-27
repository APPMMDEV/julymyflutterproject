import 'package:flutter/material.dart';

import '../Helper/ConstsData.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.black12),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black12,
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white70,
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
    ),
    colorScheme: ColorScheme.dark(
        background: Colors.transparent,
        primary: Colors.black,
        onPrimary: const Color.fromARGB(96, 114, 111, 111),
        secondary: Colors.white,
        onSecondary: Color.fromARGB(255, 106, 112, 112)));
