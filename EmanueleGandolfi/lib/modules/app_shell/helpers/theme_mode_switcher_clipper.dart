import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ThemeModeSwitcherClipper extends CustomClipper<Path> {
  final double sizeRate;
  final Offset offset;

  ThemeModeSwitcherClipper({required this.sizeRate, required this.offset});

  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(
        Rect.fromCircle(
          center: offset,
          radius: lerpDouble(0, _calcMaxRadius(size, offset), sizeRate)!,
        ),
      );
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

  double _calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }

}