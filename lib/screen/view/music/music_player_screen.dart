import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:media_player/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  MusicProvider? musicRead;
  MusicProvider? musicWatch;

  @override
  Widget build(BuildContext context) {
    musicRead = context.read<MusicProvider>();
    musicWatch = context.watch<MusicProvider>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(musicRead!.musicList[musicRead!.titleI].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(child: Center(child: Image.asset(musicRead!.musicList[musicWatch!.titleI].thumbnail,height: 216, width: 384, fit: BoxFit.cover,)))),
            SizedBox(
              height: 20,
            ),
            Theme(
              data: ThemeData(useMaterial3: false),
              child: Slider(
                value: 1,
                onChanged: (value) {},
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    musicRead!.audioPlayer.previous();
                    musicRead!.musicPlayOrPause(true);
                    musicRead!.backOrForward(musicWatch!.titleI--);
                  },
                    child: Image.asset("assets/music/controller/back.png")),
                SizedBox(width: 3,),
                InkWell(
                    onTap: () {
                      if(musicWatch!.isPlay)
                        {
                          musicRead!.audioPlayer.pause();
                        }
                      else{
                        musicWatch!.audioPlayer.play();
                      }
                      musicRead!.musicPlayOrPause(
                          musicWatch!.audioPlayer.isPlaying.value);
                    },
                    child: musicWatch!.isPlay?Image.asset("assets/music/controller/pause.png"):Image.asset("assets/music/controller/play.png")),
                SizedBox(width: 3,),
                InkWell(
                    onTap: () {
                      musicRead!.audioPlayer.next();
                      musicRead!.musicPlayOrPause(true);
                      musicRead!.backOrForward(musicWatch!.titleI++);
                    },
                    child: Image.asset("assets/music/controller/forward.png")),

              ],
            )
          ],
        ),
      ),
    ));
  }
}
