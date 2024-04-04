import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:media_player/screen/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier{
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int videoIndex = 0;
  List<Video> videoList=[
    Video(url: "assets/video/1.mp4",name: "Tu Hi Hai",thumbnail: "assets/music/thumbnail/1.jpeg",description: "Presenting the full video song of Tu Hi Hai sung by Rahul Mishra\nSong - Tu Hi Hai\nMovie - Half Girlfriend\nSinger - Rahul Mishra\nComposer - Rahul Mishra\nLyricist - Laado Suwalka"),
    Video(url: "assets/video/2.mp4",name: "Tum Hi Ho!",thumbnail: "assets/music/thumbnail/2.jpeg",description: "Song: Tum Hi Ho\nMovie: Aashiqui 2\nSinger: Arijit Singh\nMusic: Mithoon\nLyrics: Mithoon\nProducer: Bhushan Kumar Krishan Kumar Producer: Mukesh Bhatt\nDirector: Mohit Suri\nMusic Label: T-Series"),
    Video(url: "assets/video/3.mp4",name: "Sajan Sajan",thumbnail: "assets/music/thumbnail/3.jpeg",description: "79,076,722 views  Apr 15, 2020\nMovie: Aarzoo\nSinger: Alka Yagnik\nMusic: Anu Malik\nLyrics: Anand Bakshi\nCast: Akshay Kumar, Madhuri Dixit & Saif Ali Khan\nProducer: Vikas Mohan\nDirector: Lawrence D'souza"),
    Video(url: "assets/video/4.mp4",name: "Mera Dil Bhi Kitna Pagal Hai",thumbnail: "assets/music/thumbnail/4.jpeg",description: "Song : Mera Dil Bhi Kitna Pagal Hai\nSinger : Kumar Sanu & Alka Yagnik\nMusic : Nadeem- Shravan\nLyrics : Sameer\nMovie : Saajan\nDirector : Lawrence D'Souza\nStar Cast : Sanjay Dutt, Madhuri Dixit, Salman Khan, Lakshmikant Berde, Kader Khan, Reema Lagoo & Others\nProducer : Sudhakar Bokade\nBanner : Divya Films International"),
    Video(url: "assets/video/5.mp4",name: "Lost Without You",thumbnail: "assets/music/thumbnail/5.jpeg",description: "Song - Lost Without You\nSingers - Ami Mishra & Anushka Shahaney\nComposer - Ami Mishra\nLyricist - Kunaal Vermaa & Anushka Shahaney\nMusic Arranged And Programmed By Dj Phukan\nAsst. Madhab Deka "),
  ];
  void initVideoPlayer() {
    videoPlayerController =
    VideoPlayerController.asset(videoList[videoIndex].url)
      ..initialize().then((value) {
        notifyListeners();
        chewieController =
            ChewieController(videoPlayerController: videoPlayerController!,autoPlay: false);
      });
  }
  void changeIndexV(int i) {
    videoIndex = i;
    initVideoPlayer();
    notifyListeners();
  }

}