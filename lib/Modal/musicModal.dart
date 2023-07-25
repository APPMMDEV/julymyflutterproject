class myMusicData{

  List<MusicDatabase?>musicdatabase;

  myMusicData({
    required this.musicdatabase
  });

  factory myMusicData.fromJson(dynamic data){

    var mymusiclist = data['Music_DB'] as List;
    var mymusicitem = mymusiclist.map((e) => MusicDatabase.fromJson(e)).toList();

    return myMusicData(

        musicdatabase: mymusicitem
    );

  }

}




class MusicDatabase {
  String path;
  String engtitle;
  String mmtitle;
  String itemPoint;
  String musicImg;

  MusicDatabase({
    required this.path,
    required this.engtitle,
    required this.mmtitle,
    required this.itemPoint,
    required this.musicImg,
  });


  factory MusicDatabase.fromJson(dynamic data){

    return MusicDatabase(

      path: data["path"],
      engtitle: data["engtitle"],
      mmtitle: data["mmtitle"],
      itemPoint: data["item_point"],
      musicImg: data["music_img"],

    );
  }

}