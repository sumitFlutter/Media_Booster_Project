import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/music_modal.dart';

class MusicProvider with ChangeNotifier{
  int index=0;
  var audioPlayer=AssetsAudioPlayer();
  int titleI=0;
  Duration totalDuration=Duration(seconds: 0);
  bool isPlay =false;
  List<Audio> audioPlayList=[];
List<Music> musicList=[
  Music(url: "assets/music/mp3/1.mp3",name: "Tu Hi Hai",thumbnail: "assets/music/thumbnail/1.jpeg"),
  Music(url: "assets/music/mp3/2.mp3",name: "Tum Hi Ho!",thumbnail: "assets/music/thumbnail/2.jpeg"),
  Music(url: "assets/music/mp3/3.mp3",name: "Sajan Sajan",thumbnail: "assets/music/thumbnail/3.jpeg"),
  Music(url: "assets/music/mp3/4.mp3",name: "Mera Dil Bhi Kitna Pagal Hai",thumbnail: "assets/music/thumbnail/4.jpeg"),
  Music(url: "assets/music/mp3/5.mp3",name: "Lost Without You",thumbnail: "assets/music/thumbnail/5.jpeg"),
  Music(url: "assets/music/mp3/10.mp3",name: "Surprise By Developer To Users(Bonus)",thumbnail: "assets/music/thumbnail/10.jpeg"),
  Music(url: "assets/music/mp3/6.mp3",name: "Dil Galti kar Baitha hai",thumbnail: "assets/music/thumbnail/6.jpeg"),
  Music(url: "assets/music/mp3/7.mp3",name: "Dil Laga Liya Tumse",thumbnail: "assets/music/thumbnail/7.jpeg"),
  Music(url: "assets/music/mp3/8.mp3",name: "Sona Kitna Sona Hai",thumbnail: "assets/music/thumbnail/8.jpeg"),
  Music(url: "assets/music/mp3/9.mp3",name: "Zihaal e Miskin",thumbnail: "assets/music/thumbnail/9.jpeg"),

];
void setPlay(bool play)
{
  isPlay=play;
  notifyListeners();
}
void setMusic()
{
  audioPlayList=musicList.map((e) => Audio(e.url)).toList();
}
void audioInit(){
  audioPlayer.open(
    Playlist(audios: audioPlayList,
      startIndex: titleI,),
    showNotification: false,
    autoStart: false,
    loopMode: LoopMode.single,
  );
}
void getDuration()
{
  totalDuration=audioPlayer.current.value!.audio.duration;
  notifyListeners();
}
void getSong(int index)
{
  titleI=index;
  audioInit();
  notifyListeners();
}
  void backOrForward(int indexPlusOrMinus)
  {
    if(indexPlusOrMinus<0)
      {
        titleI=(musicList.length-1);
      }
    else if(indexPlusOrMinus>(musicList.length-1))
      {
        titleI=0;
      }
    else{
      titleI=indexPlusOrMinus;
    }
    notifyListeners();
  }

  void changeIndex(int i) {
  index=i;
  notifyListeners();
  }

}