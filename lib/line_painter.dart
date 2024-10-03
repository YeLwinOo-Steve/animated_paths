import 'package:animated_path/extension/path_ex.dart';
import 'package:flutter/material.dart';

class LinePathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color color;
  final double strokeWidth;
  const LinePathPainter(
    this._animation, {
    required this.color,
    this.strokeWidth = 3.0,
  });

  Path _createLinePath(Size size) {
    var path = Path();
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;
    final path = _createLinePath(size).createAnimatedPath(animationPercent);
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
