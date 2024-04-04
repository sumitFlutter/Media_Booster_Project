import 'package:flutter/material.dart';
import 'package:media_player/screen/provider/music_provider.dart';
import 'package:media_player/screen/provider/video_provider.dart';
import 'package:media_player/utils/routes/routes.dart';
import 'package:provider/provider.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: MusicProvider()),
            ChangeNotifierProvider.value(value: VideoProvider())
          ],
          child: Consumer<MusicProvider>(
            builder: (context, value, child) {
              value.setMusic();
              return
            MaterialApp(
              theme: ThemeData.dark(),
              debugShowCheckedModeBanner: false,
              routes: appRoutes,
            );
            }
          ),
        ),
  );
}