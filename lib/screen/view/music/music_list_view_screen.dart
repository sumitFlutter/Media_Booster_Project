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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Expanded(
          child: ListView.builder(itemCount: context
              .watch<MusicProvider>()
              .musicList
              .length, itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    context.read<MusicProvider>().getSong(index);
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