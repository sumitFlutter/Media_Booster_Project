import 'package:assets_audio_player/assets_audio_player.dart';
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
        title: Text(musicWatch!.musicList[musicWatch!.titleI].name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Container(child: Center(child: Image.asset(musicWatch!.musicList[musicWatch!.titleI].thumbnail,height: 216, width: 384, fit: BoxFit.cover,)))),
            const SizedBox(
              height: 20,
            ),
            PlayerBuilder.currentPosition(
              player: musicWatch!.audioPlayer,
              builder: (context, position) =>
              Column(
                children: [
                  Theme(
                    data: ThemeData(useMaterial3: false),
                    child: Slider(
                      value: position.inSeconds.toDouble(),
                      onChanged: (value) {
                        musicRead!.audioPlayer
                            .seek(Duration(seconds: value.toInt()));
                      },
                      max: musicWatch!.totalDuration.inSeconds.toDouble(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("$position",
                            style:
                            const TextStyle(color: Colors.white, fontSize: 18)),
                        Text("${musicWatch!.totalDuration}",
                            style:
                            const TextStyle(color: Colors.white, fontSize: 18))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                musicWatch!.titleI==0?Image.asset("assets/music/controller/back_disabled.png",height: 80,fit: BoxFit.cover,):
                InkWell(
                  onTap: () {
                    musicRead!.audioPlayer.pause();
                    musicRead!.setPlay(false);
                    musicRead!.audioPlayer.previous();
                    musicRead!.getDuration();
                    musicRead!.setPlay(true);
                    musicRead!.backOrForward(musicWatch!.titleI-1);
                  },
                    child: Image.asset("assets/music/controller/back.png")),
                const SizedBox(width: 15,),
                InkWell(
                    onTap: () {
                      if(musicWatch!.isPlay)
                        {
                          musicRead!.audioPlayer.pause();
                          musicRead!.setPlay(false);
                        }
                      else{
                        musicRead!.audioPlayer.play();
                        musicRead!.setPlay(true);
                      }
                    },
                    child: musicWatch!.isPlay?Image.asset("assets/music/controller/pause.png"):Image.asset("assets/music/controller/play.png")),
                const SizedBox(width: 15,),
                InkWell(
                    onTap: ()  {
                      musicRead!.audioPlayer.pause();
                      musicRead!.setPlay(false);
                     musicRead!.audioPlayer.next();
                      musicRead!.getDuration();
                     musicRead!.setPlay(true);
                      musicRead!.backOrForward(musicWatch!.titleI+1);
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
