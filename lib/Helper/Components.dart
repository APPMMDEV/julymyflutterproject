import 'package:flutter/material.dart';
import 'package:myflutterproject/Helper/ConstsData.dart';
import 'package:myflutterproject/Modal/datamodel.dart';
import 'package:myflutterproject/Pages/LyricDetail.dart';
import 'package:myflutterproject/Modal/lyricmodel.dart';
import 'package:myflutterproject/Pages/myPostDetail.dart';
import 'package:myflutterproject/Pages/readPost.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Modal/musicModal.dart';
import '../Pages/musicPlay.dart';
//
// import '../Music/musicModal.dart';
// import '../Music/musicPlay.dart';

class Components {
  static Widget getPostCardContainer2(context, PostDatabase postData) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Container(
            height: 130,
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              color: Theme.of(context).colorScheme.onPrimary,
              elevation: 5,
              shadowColor: Theme.of(context).colorScheme.onSecondary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                child: InkWell(
                  onTap: () async {
                    var pointpref = await SharedPreferences.getInstance();
                    int i = pointpref.getInt('key') ?? 0;
                    pointpref.setInt('key', i + 1);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            viewPost(postDatabase: postData)));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Image.network(
                          postData.image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  postData.pubDate,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.lightBlueAccent),
                                  maxLines: 3,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  postData.mmtitle,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    postData.mmcontent,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    maxLines: 3,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  static Widget getLyricCardContainer(context, LyricsDatabase data) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          color: Theme.of(context).colorScheme.onPrimary,
          elevation: 5,
          shadowColor: Theme.of(context).colorScheme.onSecondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LyricDetail(data: data)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      data.title,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary),
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      data.title,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary),
                      maxLines: 1,
                    ),
                  ),
                  Container(
                    width: 100,
                    child: Text(
                      data.singername,
                      style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget getMusicCardContainer(context, MusicDatabase data) {
    return Center(
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          color: Theme.of(context).colorScheme.primary,
          elevation: 5,
          shadowColor: Theme.of(context).colorScheme.onPrimary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => musicPlay(musicDatabase: data)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Container(
                      width: 100,
                      child: Text(
                        data.mmtitle,
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).colorScheme.secondary),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  Container(width: 100, child: Image.network(data.musicImg)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }
}
