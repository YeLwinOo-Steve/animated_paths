import 'package:animated_path/line_path.dart';
import 'package:flutter/material.dart';

import 'wave_path.dart';

class AnimatedPaths extends StatefulWidget {
  const AnimatedPaths({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnimatedPathsState createState() => _AnimatedPathsState();
}

class _AnimatedPathsState extends State<AnimatedPaths>
    with SingleTickerProviderStateMixin {
  late final AnimationController pathController;

  @override
  void initState() {
    super.initState();
    pathController = AnimationController(
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
    pathController.dispose();
    super.dispose();
  }

  Animation<double> get pathTween => CurvedAnimation(
        parent: pathController,
        curve: Curves.easeInOut,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 300,
              height: 150,
              child: LinePath(
                color: Colors.teal,
                animation: pathTween,
              ),
            ),
            SizedBox(
              width: 300,
              height: 150,
              child: WavePath(
                color: Colors.teal,
                animation: pathTween,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
