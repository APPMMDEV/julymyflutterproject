class LyricData{

List<LyricsDatabase?>lyricdb;

LyricData({
  required this.lyricdb
});

factory LyricData.fromJson(dynamic data){

  var lyriclist = data['Lyrics_Database'] as List;
  var lyricitemList = lyriclist.map((e) => LyricsDatabase.fromJson(e)).toList();

return LyricData(

  lyricdb: lyricitemList
);

}

}




class LyricsDatabase {
    String singername;
    String title;
    String albumtitle;
    String lyricImg;
    String credit;
    String postId;
    String searchData;

    LyricsDatabase({
        required this.singername,
        required this.title,
        required this.albumtitle,
        required this.lyricImg,
        required this.credit,
        required this.postId,
        required this.searchData,
    });


factory LyricsDatabase.fromJson(dynamic data){

  return LyricsDatabase(

singername: data["singername"],
        title: data["title"],
        albumtitle: data["albumtitle"],
        lyricImg: data["lyricImg"],
        credit: data["credit"],
        postId: data["postId"],
        searchData: data["searchData"],

  );
}

}