import 'package:animated_path/extension/path_ex.dart';
import 'package:flutter/material.dart';


class WavePathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color color;
  final double strokeWidth;
  const WavePathPainter(
    this._animation, {
    required this.color,
    this.strokeWidth = 3.0,
  });
  Path _createWavePath(Size size) {
    var path = Path();
    var x = 0.0;
    var numberOfWaves = 5;
    var increment = size.width / numberOfWaves;
    bool startFromTop = true;

    while (x < size.width) {
      if (startFromTop) {
        path.moveTo(x, 0);
        path.cubicTo(x + increment / 2, 0, x + increment / 2, size.height,
            x + increment, size.height);
      } else {
        path.moveTo(x, size.height);
        path.cubicTo(x + increment / 2, size.height, x + increment / 2, 0,
            x + increment, 0);
      }
      x += increment;
      startFromTop = !startFromTop;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;
    final path = _createWavePath(size).createAnimatedPath(animationPercent);

    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
