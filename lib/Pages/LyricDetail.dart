
import 'package:flutter/material.dart';
import 'package:myflutterproject/Modal/lyricmodel.dart';

class LyricDetail extends StatelessWidget {



  final LyricsDatabase data;
  const LyricDetail({super.key,required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
        backgroundColor: Theme.of(context).colorScheme.primary,


        appBar:  AppBar(

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                data.title,
                style: TextStyle(fontSize: 12),
              ),




              Text(data.singername,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 11 ,color: Theme.of(context).colorScheme.secondary,),

              )
            ],
          ),



          
        ),
      body: Container(

        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(

          child: Center(

              child:
              Image.network(data.lyricImg)
          ),
        ),
      ),
    );
  }
}