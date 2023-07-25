import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';

class ConstsData {
  static var PostApi =
      'https://mctvteam.github.io/Coder/Data/V10/testPostNew.json';
  static var LyricApi = 'https://appmmdev.github.io/MMLyric/Data/lyrics.json';

  static var MusicApi =
      'https://jackrevo95.github.io/jackrevo/NOR6/Music/music.json';
  static var PostApi1 =
      'https://jackrevo95.github.io/jackrevo/NOR6/Post/post.json';

  static Future<String> getPts() async {
    var pointpref = await SharedPreferences.getInstance();
    var ptss = pointpref.getInt('key') ?? 0;

    return ptss.toString();
  }

  static const myprimarycolor = Color(0xFFF17006);
  static const mysecondarycolor = Color(0xFF04212F);
  static const mythirdarycolor = Color(0xFFF04239);
}
