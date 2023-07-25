import 'package:flutter/material.dart';
import 'package:myflutterproject/Helper/ConstsData.dart';
ThemeData lightTheme = ThemeData(

    brightness: Brightness.light,
    
  appBarTheme: const AppBarTheme(backgroundColor: ConstsData.myprimarycolor ),

    bottomNavigationBarTheme:   const   BottomNavigationBarThemeData(

  backgroundColor: ConstsData.myprimarycolor ,
  selectedItemColor: Colors.yellow,
  unselectedItemColor: Colors.white,
  elevation: 20.0,
  type: BottomNavigationBarType.fixed,

),


  colorScheme: const ColorScheme.light(
    background: Colors.transparent,
    primary: ConstsData.myprimarycolor ,
    secondary: Colors.white,
  )

);