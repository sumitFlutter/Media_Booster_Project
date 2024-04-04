import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/video_provider.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
              providerR!.chewieController!.pause();
           },
                  icon: Icon(Icons.arrow_back_ios_new)),
          title: Text("Video"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 200,
                child: Chewie(controller: providerW!.chewieController!)),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${providerW!.videoList[providerW!.videoIndex].name}",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                  Text("Description: ${providerW!.videoList[providerW!.videoIndex].description}",
                      style: TextStyle(fontSize: 18)),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
