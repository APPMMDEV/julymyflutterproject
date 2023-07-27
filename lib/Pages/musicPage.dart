import 'package:flutter/material.dart';

import '../Api/Api.dart';
import '../Helper/Components.dart';

class musicPage extends StatefulWidget {
  const musicPage({super.key});

  @override
  State<musicPage> createState() => _musicPageState();
}

class _musicPageState extends State<musicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Theme.of(context).colorScheme.primary,
      child: FutureBuilder(
        future: Api.getMyMusic(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Components.getMusicCardContainer(
                      context, snapshot.data![index]);
                });
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }
        },
      ),
    ));
  }
}
