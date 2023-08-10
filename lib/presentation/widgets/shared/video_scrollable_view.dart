import 'package:flutter/material.dart';
import 'package:videos_tiktok_app/domain/entities/videos_post.dart';
import 'package:videos_tiktok_app/presentation/widgets/shared/video_bottons.dart';
import 'package:videos_tiktok_app/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      //permite hacer scroll de manera vertical
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      //la catidad de los items sera la cantidad de videos que hayan
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final videoPost = videos[index];
        // el stack es para colocar elementos encima  de otros
        return Stack(
          children: [
            //video player + gradiente
            //es la caja donde ira el video
            SizedBox.expand(
              child: FullScreenPlayer(caption: videoPost.caption, videoUrl: videoPost.videoUrl,),
            ),

            //Botones
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(video: videoPost)
              ),
          ],
        );
      },
    );
  }
}
