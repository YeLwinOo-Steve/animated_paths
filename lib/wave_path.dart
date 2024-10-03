import 'package:animated_path/wave_painter.dart';
import 'package:flutter/material.dart';

class WavePath extends StatelessWidget {
  const WavePath({
    super.key,
    required this.color,
    required this.animation,
  });
  final Animation<double> animation;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: WavePathPainter(
        animation,
        color: color,
      ),
    );
  }
}
