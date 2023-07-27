import 'package:flutter/material.dart';

import '../Helper/ConstsData.dart';

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme:
        const AppBarTheme(backgroundColor: Color.fromARGB(96, 114, 111, 111)),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(96, 114, 111, 111),
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white70,
      elevation: 20.0,
      type: BottomNavigationBarType.fixed,
    ),
    colorScheme: ColorScheme.dark(
        background: Colors.transparent,
        onPrimary: Colors.black,
        primary: const Color.fromARGB(96, 114, 111, 111),
        secondary: Colors.white,
        onSecondary: Color.fromARGB(255, 106, 112, 112)));
