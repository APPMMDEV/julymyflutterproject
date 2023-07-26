import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:myflutterproject/Modal/musicModal.dart';

import '../Helper/Components.dart';
import '../Modal/musicModal.dart';

class musicPlay extends StatefulWidget {
  final MusicDatabase musicDatabase;
  const musicPlay({super.key, required this.musicDatabase});

  @override
  State<musicPlay> createState() => _musicPlayState();
}

class _musicPlayState extends State<musicPlay> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  
  @override
  void initState() {
    // TODO: implement initState
    audioPlayer.onPlayerStateChanged.listen((event) {
      setState(() {
        isPlaying = event == PlayerState.playing;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    if(isPlaying){

      audioPlayer.dispose();
    }


    setAudio();
    super.initState();
  }


  Future setAudio() async {

    audioPlayer.stop();
    audioPlayer.setReleaseMode(ReleaseMode.stop);
    var url = widget.musicDatabase.path;
    var source = UrlSource(url);


 await audioPlayer.play(source);

  

  }

  @override
  void dispose() {
    // TODO: implement dispose

    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.musicDatabase.mmtitle,style: TextStyle(fontSize: 12),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.musicDatabase.musicImg,
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 32),
              Center(
                child: Text(widget.musicDatabase.mmtitle,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 4),
              Center(
                child: Text(widget.musicDatabase.engtitle,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold)),
              ),
              Slider(
                  min: 0,
                  max: duration.inSeconds.toDouble(),
                  value: position.inSeconds.toDouble(),
                  onChanged: (value) {
                    final position = Duration(seconds: value.toInt());
                    setState(() async {
                      await audioPlayer.seek(position);
                      await audioPlayer.resume();
                    });
                  }),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Components.formatTime(position)),
                    Text(Components.formatTime(duration - position))
                  ],
                ),
              ),
              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                  radius: 35,
                  child: IconButton(

                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow,color: Theme.of(context).colorScheme.secondary,),
                    iconSize: 50,
                    onPressed: () async {
                      if (isPlaying) {
                        await audioPlayer.pause();
                      } else {
                        var url = widget.musicDatabase.path;
                        var source = UrlSource(url);
                        await audioPlayer.play(source);
                      }
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
