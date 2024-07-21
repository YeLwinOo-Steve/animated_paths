import 'package:animated_path/wave_painter.dart';
import 'package:flutter/material.dart';

class AnimatedWave extends StatefulWidget {
  const AnimatedWave({super.key});

  @override
  _AnimatedWaveState createState() => _AnimatedWaveState();
}

class _AnimatedWaveState extends State<AnimatedWave>
    with SingleTickerProviderStateMixin {
  late final AnimationController waveController;

  @override
  void initState() {
    super.initState();
    waveController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    )
      ..repeat(reverse: true)
      ..addListener(
        () => setState(() {}),
      );
  }

  @override
  void dispose() {
    waveController.dispose();
    super.dispose();
  }

  Animation<double> get waveTween => CurvedAnimation(
        parent: waveController,
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 150,
          child: WavePath(
            color: Colors.teal,
            animation: waveTween,
          ),
        ),
      ),
    );
  }
}

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
