import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class FlutterJobLoader extends StatefulWidget {
  final Color color;
  final double width, height;

  const FlutterJobLoader({
    this.color = AppColors.primaryLight,
    super.key,
    this.width = 80,
    this.height = 80,
  });

  @override
  State<FlutterJobLoader> createState() => _FlutterJobLoaderState();
}

class _FlutterJobLoaderState extends State<FlutterJobLoader>
    with TickerProviderStateMixin {
  late AnimationController rotateController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 10),
  )..repeat();

  late AnimationController pulseController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  );

  double scale = 0.5;

  void _changeScale() {
    setState(() => scale = scale == 0.5 ? 0.8 : 0.5);
  }

  late Timer timeout;

  @override
  void initState() {
    timeout = Timer.periodic(
      const Duration(seconds: 3),
      (timer) => _changeScale(),
    );
    super.initState();
  }

  @override
  void dispose() {
    rotateController.dispose();
    timeout.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: rotateController,
              builder: (context, child) => Transform.rotate(
                angle: rotateController.value * 2 * math.pi,
                child: child,
              ),
              child: Image.asset(
                "assets/images/offerte_logo.png",
                color: widget.color,
              ),
            ),
            AnimatedScale(
              scale: scale,
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: Image.asset(
                "assets/images/flutter_logo.png",
                color: widget.color,
              ),
            ),
          ],
        ),
      );
}
