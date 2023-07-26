import 'dart:convert';

import 'package:myflutterproject/Helper/ConstsData.dart';
import 'package:myflutterproject/Modal/datamodel.dart';
import 'package:myflutterproject/Modal/lyricmodel.dart';

import 'package:http/http.dart' as http;

import '../Modal/musicModal.dart';

class Api {
  static Future<List<LyricsDatabase>> getMyLyric() async {
    Uri uri = Uri.parse(ConstsData.LyricApi);
    var resStr = await http.get(uri);
    var response = jsonDecode(resStr.body);

    var rList = response["Lyrics_Database"] as List;

    List<LyricsDatabase> ld =
        rList.map((e) => LyricsDatabase.fromJson(e)).toList();

    return ld;
  }

  static Future<List<PostDatabase>> getMyPost() async {
    Uri uri = Uri.parse(ConstsData.PostApi1);
    var uriaw = await http.get(uri);
    var response = jsonDecode(uriaw.body);

    var rList = response['Post_DB'] as List;

    List<PostDatabase> ld = rList.map((f) => PostDatabase.fromJson(f)).toList();

    return ld;
  }

  static Future<List<MusicDatabase>> getMyMusic() async {
    Uri uri = Uri.parse(ConstsData.MusicApi);
    var music = await http.get(uri);
    var response = jsonDecode(music.body);

    var rList = response['Music_DB'] as List;

    List<MusicDatabase> ld =
        rList.map((f) => MusicDatabase.fromJson(f)).toList();

    return ld;
  }
}
