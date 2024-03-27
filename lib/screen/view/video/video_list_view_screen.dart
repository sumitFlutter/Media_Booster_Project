import 'package:flutter/material.dart';

class VideoListViewScreen extends StatefulWidget {
  const VideoListViewScreen({super.key});

  @override
  State<VideoListViewScreen> createState() => _VideoListViewScreenState();
}

class _VideoListViewScreenState extends State<VideoListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Video"),);
  }
}
