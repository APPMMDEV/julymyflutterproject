import 'package:flutter/material.dart';
import 'package:myflutterproject/Modal/datamodel.dart';

import '../Api/Api.dart';
import '../Helper/Components.dart';



class MyPostPage extends StatefulWidget {
  const MyPostPage({super.key});


  @override
  State<MyPostPage> createState() => _MyPostPageState();
}

class _MyPostPageState extends State<MyPostPage> {

  List<PostDatabase>myPost = [];




  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      future: Api.getMyPost(),
      builder: (context,snapshot){

        if(snapshot.hasData){

          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder:(context,index){
                return Components.getPostCardContainer2(

                    context, snapshot.data![index]);
              });
        }else{

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      },
    );
  }
}
