import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:videos_tiktok_app/config/helpers/human_formats.dart';
import 'package:videos_tiktok_app/domain/entities/videos_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;
  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButtom(
            value: video.likes, iconData: Icons.favorite, iconColor: Colors.red,),
        const SizedBox(height: 20,),

        _CustomIconButtom(value: video.views, iconData: Icons.visibility),

        const SizedBox(height: 20,),
        SpinPerfect(
          infinite: true, 
          duration: const Duration(seconds: 3), 
          child: const _CustomIconButtom(value: 0, iconData: Icons.play_circle_outline))

      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButtom(
      {required this.value,
      required this.iconData,
      //this.color
      iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color, size: 30,
            )),
        if (value > 0)
        Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}
