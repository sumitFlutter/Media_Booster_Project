import 'package:flutter/material.dart';
import 'package:media_player/screen/view/music/music_list_view_screen.dart';
import 'package:media_player/screen/view/video/video_list_view_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
                appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text("Media Player"),
          bottom: TabBar(
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(icon: Icon(Icons.music_note),text: "Music",),
              Tab(icon: Icon(Icons.video_file),text: "video",)
            ],
          ),
                ),
          body: TabBarView(children: [
            MusicListViewScreen(),
            VideoListViewScreen(),
          ],),),
        ));
  }
}
