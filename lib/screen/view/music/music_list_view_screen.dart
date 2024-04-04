import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/provider/music_provider.dart';
import 'package:provider/provider.dart';

class MusicListViewScreen extends StatefulWidget {
  const MusicListViewScreen({super.key});

  @override
  State<MusicListViewScreen> createState() => _MusicListViewScreenState();
}

class _MusicListViewScreenState extends State<MusicListViewScreen> {
  MusicProvider? musicRead;
  MusicProvider? musicWatch;
  @override
  Widget build(BuildContext context) {
    musicRead = context.read<MusicProvider>();
    musicWatch = context.watch<MusicProvider>();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: false,
            initialPage: 0,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              musicRead!.changeIndex(index);
            },
          ),
          itemCount: musicWatch!.musicList.length,
          itemBuilder: (context, index, realIndex) => InkWell(onTap: (){
            context.read<MusicProvider>().audioPlayer.pause();
            context.read<MusicProvider>().setPlay(false);
            context.read<MusicProvider>().getSong(index);
            context.read<MusicProvider>().getDuration();
            Navigator.pushNamed(context, "musicPlayer");
          },
            child: Image.asset(
                "${musicWatch!.musicList[index].thumbnail}",
                height: 108,
                width: 196),
          ),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(musicWatch!.musicList.length, (index) => Container(
            height: 10,width: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: index==musicWatch!.index?Colors.blue:Colors.grey),
            margin: EdgeInsets.all(2),
          )),
        ),
            SizedBox(height: 5,),
        Expanded(
          child: ListView.builder(itemCount: context
              .watch<MusicProvider>()
              .musicList
              .length, itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    context.read<MusicProvider>().audioPlayer.pause();
                    context.read<MusicProvider>().setPlay(false);
                    context.read<MusicProvider>().getSong(index);
                    context.read<MusicProvider>().getDuration();
                    Navigator.pushNamed(context, "musicPlayer");
                  },
                  leading: Icon(Icons.music_note),
                  title: Text(context
                      .read<MusicProvider>()
                      .musicList[index].name),
                  trailing: Icon(Icons.arrow_forward_ios),)
            );
          },),
        ),
      ],),
    );
  }
}