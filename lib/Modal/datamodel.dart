class myPostData{

  List<PostDatabase?>postdb;

  myPostData({
    required this.postdb
  });

  factory myPostData.fromJson(dynamic data){

    var mypostlist = data['Post_DB'] as List;
    var mypostitem = mypostlist.map((e) => PostDatabase.fromJson(e)).toList();

    return myPostData(

        postdb: mypostitem
    );

  }

}




class PostDatabase {
  String mmtitle;
  String engtitle;
  String pubDate;
  String timeStamp;
  String mmcontent;
  String engcontent;
  String image;

  PostDatabase({
    required this.mmtitle,
    required this.engtitle,
    required this.pubDate,
    required this.timeStamp,
    required this.mmcontent,
    required this.engcontent,
    required this.image,
  });


  factory PostDatabase.fromJson(dynamic data){

    return PostDatabase(

      mmtitle: data["mmtitle"],
      engtitle: data["engtitle"],
      pubDate: data["pubDate"],
      timeStamp: data["timeStamp"],
      mmcontent: data["mmcontent"],
      engcontent: data["engcontent"],
      image: data["image"],

    );
  }

}