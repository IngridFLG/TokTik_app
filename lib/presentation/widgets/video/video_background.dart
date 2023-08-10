import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const VideoBackground(
      {super.key,
      //siempre tendra estos colores
      this.colors = const [Colors.transparent, Colors.black87],
      this.stops = const[0.0, 1,0]
      }): assert( colors.length == stops.length, 'stops y colors deben ser del mismo tamaño');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors, 
            stops: stops,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )),
    ));
  }
}
