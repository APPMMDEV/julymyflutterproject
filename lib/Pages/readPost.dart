import 'package:flutter/material.dart';
import 'package:myflutterproject/Modal/datamodel.dart';

class viewPost extends StatefulWidget {
  final PostDatabase postDatabase;
  const viewPost({super.key, required this.postDatabase});

  @override
  State<viewPost> createState() => _viewPostState();
}

class _viewPostState extends State<viewPost> {
  bool _mmlanguage = false;

  String mtitle = '';
  String engtitle = '';

  var ptitle = '';
  var content = '';

  @override
  void initState() {
    ptitle = widget.postDatabase.engtitle;
    content = widget.postDatabase.engcontent;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'ENG',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                Switch(
                    value: _mmlanguage,
                    onChanged: (_newvalue) {
                      setState(() {
                        if (_mmlanguage) {
                          ptitle = widget.postDatabase.engtitle;
                          content = widget.postDatabase.engcontent;
                        } else {
                          ptitle = widget.postDatabase.mmtitle;
                          content = widget.postDatabase.mmcontent;
                        }

                        _mmlanguage = _newvalue;
                      });
                    }),
                Text(
                  'MM',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),
          )
        ],
        title: Text(
          ptitle,
          style: TextStyle(
              fontSize: 14, color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.network(widget.postDatabase.image)),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.topRight,
              child: Text(
                widget.postDatabase.pubDate,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.45,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       image: DecorationImage(
            //           image: NetworkImage(widget.postDatabase.image),
            //           fit: BoxFit.cover)),
            // ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                content,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
