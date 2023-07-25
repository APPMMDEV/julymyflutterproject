import 'package:flutter/material.dart';
import 'package:myflutterproject/Helper/Components.dart';
import '../Api/Api.dart';
import '../Modal/lyricmodel.dart';

class LyricsPage extends StatefulWidget {
  const LyricsPage({super.key});

  @override
  State<LyricsPage> createState() => _LyricsPageState();
}

class _LyricsPageState extends State<LyricsPage> {
  List<LyricsDatabase> lyricData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: Api.getMyLyric(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Components.getLyricCardContainer(
                    context, snapshot.data![index]);
              });
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      },
    ));
  }
}
