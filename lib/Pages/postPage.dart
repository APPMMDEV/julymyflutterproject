import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:myflutterproject/Modal/datamodel.dart';

import '../Api/Api.dart';
import '../Helper/Components.dart';

class MyPostPage extends StatefulWidget {
  const MyPostPage({super.key});

  @override
  State<MyPostPage> createState() => _MyPostPageState();
}

class _MyPostPageState extends State<MyPostPage> {
  List<PostDatabase> myPost = [];

  late PostDatabase postDatabase;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: FutureBuilder(
        future: Api.getMyPost(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Components.getPostCardContainer2(
                        context, snapshot.data![index]);
                  }),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
        },
      ),
    );
  }

  Widget myimg(PostDatabase postDatabase) {
    return Image.network(postDatabase.image);
  }
}
