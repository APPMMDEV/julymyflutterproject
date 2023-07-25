
import 'package:flutter/material.dart';
import 'package:myflutterproject/Modal/datamodel.dart';

class myPostDetail extends StatelessWidget {



  final PostDatabase postData;
  const myPostDetail({super.key,required this.postData});
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Theme.of(context).colorScheme.primary,


      appBar:  AppBar(

        title: Text(
          postData.mmtitle,
          style: TextStyle(fontSize: 12),
        ),


      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(

            children: [
              Container(
                alignment: Alignment.topRight,

                child: Text(postData.pubDate,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary,),

                ),
              ),
              SizedBox(height: 5,),
              Center(child: Image.network(postData.image)),

              Text(postData.mmcontent,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,),

              )
            ],
          ),
        ),
      ),
    );
  }
}