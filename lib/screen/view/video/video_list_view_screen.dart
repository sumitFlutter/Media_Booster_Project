import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/video_provider.dart';

class VideoListViewScreen extends StatefulWidget {
  const VideoListViewScreen({super.key});

  @override
  State<VideoListViewScreen> createState() => _VideoListViewScreenState();
}

class _VideoListViewScreenState extends State<VideoListViewScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;
  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Column(
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 200,
            autoPlay: true,
            enlargeCenterPage: false,
            initialPage: 0,
            viewportFraction: 0.8,
            onPageChanged: (index, reason) {
              providerR!.changeIndexV(index);
            },
          ),
          itemCount: providerR!.videoList.length,
          itemBuilder: (context, index, realIndex) => InkWell(onTap: (){
            providerR!.changeIndexV(index);
            Navigator.pushNamed(context, 'video');
          },

            child: Image.asset(
                providerW!.videoList[index].thumbnail,
                height: 108,
                width: 196),
          ),
        ),
        SizedBox(height: 5,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(providerR!.videoList.length, (index) => Container(
            height: 10,width: 10,decoration: BoxDecoration(shape: BoxShape.circle,color: index==providerR!.videoIndex?Colors.blue:Colors.grey),
            margin: EdgeInsets.all(2),
          )),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: providerR!.videoList.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                providerR!.changeIndexV(index);
                Navigator.pushNamed(context, 'video');
              },
              child: Container(
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset("${providerW!.videoList[index].thumbnail}",
                        height: 108,width: 192, fit: BoxFit.cover),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "${providerW!.videoList[index].name}",
                      style: const TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

