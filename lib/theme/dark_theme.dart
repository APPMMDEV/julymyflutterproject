import 'package:flutter/material.dart';

import '../Helper/ConstsData.dart';
ThemeData darkTheme = ThemeData(

  brightness: Brightness.dark,

  appBarTheme: const AppBarTheme(backgroundColor: ConstsData.mysecondarycolor),

  bottomNavigationBarTheme:   const   BottomNavigationBarThemeData(

    backgroundColor: ConstsData.mysecondarycolor,
    selectedItemColor: Colors.yellow,
    unselectedItemColor: Colors.white70,
    elevation: 20.0,
    type: BottomNavigationBarType.fixed,

  ),

  colorScheme: ColorScheme.dark(
    background: Colors.transparent,
    primary: ConstsData.mysecondarycolor,
    secondary: Colors.white70,



  )

);