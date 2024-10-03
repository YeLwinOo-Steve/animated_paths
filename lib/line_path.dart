import 'package:animated_path/line_painter.dart';
import 'package:flutter/material.dart';

class LinePath extends StatelessWidget {
  const LinePath({
    super.key,
    required this.animation,
    required this.color,
  });
  final Animation<double> animation;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePathPainter(
        animation,
        color: color,
      ),
    );
  }
}
