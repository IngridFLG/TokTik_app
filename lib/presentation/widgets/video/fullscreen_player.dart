import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videos_tiktok_app/presentation/widgets/video/video_background.dart';

class FullScreenPlayer extends StatefulWidget {
  //mirar Video_Scrollable_view.dar de ahi se manda la url del video
  final String videoUrl;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoUrl, required this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          }
          // detector de gestos
          return GestureDetector(
            // darle tap a la pantalla para que se pause
            onTap: () {
              if (controller.value.isPlaying) {
                controller.pause();
                return;
              }

              controller.play();
            },
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: Stack(
                children: [
                  // reproduccion del video
                  VideoPlayer(controller),

                  // gradiente
                  VideoBackground(stops: const [0.5, 1.0],),

                  // texto del video
                  Positioned(
                      bottom: 50,
                      left: 20,
                      child: _VideoCaption(caption: widget.caption))
                ],
              ),
            ),
          );
        });
  }
}

class _VideoCaption extends StatelessWidget {
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    //para agarrar el tamaño de la pantalla
    final size = MediaQuery.of(context).size;
    // el estilo del titulo
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return SizedBox(
      width: size.width * 0.6,
      child: Text(
        caption,
        maxLines: 2,
        style: titleStyle,
      ),
    );
  }
}
