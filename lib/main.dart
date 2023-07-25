import 'package:flutter/material.dart';
import 'package:myflutterproject/Pages/ProfilePage.dart';
import 'package:myflutterproject/Pages/lyricspage.dart';
import 'package:myflutterproject/Pages/musicPage.dart';
import 'package:myflutterproject/Pages/postPage.dart';
import 'package:myflutterproject/theme/dark_theme.dart';
import 'Helper/ConstsData.dart';
import 'theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;
  final screens = [MyPostPage(), LyricsPage(), musicPage(), MyProfile()];

  bool _switch = false;
  ThemeData _dark = darkTheme;
  ThemeData _light = lightTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _switch ? _dark : _light,
      home: Scaffold(
          appBar: AppBar(
            title: Text('MCoder Blog'),
            centerTitle: true,
            actions: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Switch(
                        value: _switch,
                        onChanged: (_newvalue) {
                          setState(() {
                            _switch = _newvalue;
                          });
                        }),
                    Text('Dark Mode')
                  ],
                ),
              )
            ],
          ),
          body: screens[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => currentIndex = index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.lyrics),
                label: 'Lyrics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Musics',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          )),
    );
  }
}
