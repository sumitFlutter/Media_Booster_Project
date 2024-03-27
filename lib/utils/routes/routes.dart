import 'package:flutter/cupertino.dart';
import 'package:media_player/screen/view/dash/dash_screen.dart';
import 'package:media_player/screen/view/music/music_player_screen.dart';

Map <String,WidgetBuilder> appRoutes={
  "/":(context) => DashScreen(),
  "musicPlayer":(context) => MusicPlayer(),
};