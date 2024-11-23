import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../controller/video_controller.dart';

class VideoPage extends StatelessWidget {
  final int moduleId;

  VideoPage({required this.moduleId});

  @override
  Widget build(BuildContext context) {
    final VideoController controller = Get.put(VideoController());

    controller.loadVideos(moduleId);

    return Scaffold(
      appBar: AppBar(title: Text('Videos')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.error.value.isNotEmpty) {
          return Center(child: Text('Error: ${controller.error.value}'));
        }

        return ListView.builder(
          itemCount: controller.videos.length,
          itemBuilder: (context, index) {
            final video = controller.videos[index];

            // YouTube video player
            if (video.platform == 'youtube') {
              return YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(video.videoUrl)!,
                  flags: YoutubePlayerFlags(autoPlay: false),
                ),
              );
            }
            // Vimeo video player
            else if (video.platform == 'vimeo') {
              String? videoId = _extractVimeoId(video.videoUrl);

              if (videoId != null) {
                return Container(
                  height: 200,  // Set height here
                  width: double.infinity,  // Set width to full screen
                  child: VimeoPlayer(
                    videoId: videoId,  // Pass the extracted videoId
                  ),
                );
              } else {
                return Center(child: Text('Invalid Vimeo URL'));
              }
            }
            return Container(); // Fallback in case no matching platform
          },
        );
      }),
    );
  }

  // Helper function to extract the video ID from Vimeo URL
  String? _extractVimeoId(String videoUrl) {
    final RegExp vimeoRegExp = RegExp(r'vimeo\.com/(\d+)');
    final match = vimeoRegExp.firstMatch(videoUrl);
    if (match != null && match.group(1) != null) {
      return match.group(1);  // Extracted videoId
    }
    return null;
  }
}
