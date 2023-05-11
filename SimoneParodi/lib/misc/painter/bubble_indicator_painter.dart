import 'dart:math';

import 'package:flutter/material.dart';

class BubbleIndicatorPainter extends CustomPainter {
  final Paint painter;
  final double dxTarget;
  final double dxEntry;
  final double radius;
  final double dy;

  final PageController pageController;

  BubbleIndicatorPainter({
    this.dxTarget = 87,
    this.dxEntry = 20,
    this.radius = 25,
    this.dy = 55 / 2,
    required Color backgroundColor,
    required this.pageController,
  })  : painter = Paint()
          ..color = backgroundColor
          ..style = PaintingStyle.fill,
        super(
          repaint: pageController,
        );

  @override
  void paint(Canvas canvas, Size size) {
    final entry = Offset(dxEntry, dy);
    final target = Offset(dxTarget, dy);

    final path = Path();
    path.addArc(Rect.fromCircle(center: entry, radius: radius), 0.5 * pi, pi);
    path.addRect(Rect.fromLTRB(entry.dx, dy - radius, target.dx, dy + radius));
    path.addArc(Rect.fromCircle(center: target, radius: radius), 1.5 * pi, pi);

    final pos = pageController.position;
    final fullExtent =
        pos.maxScrollExtent - pos.minScrollExtent + pos.viewportDimension;

    final pageOffset = min(pos.extentBefore, pos.maxScrollExtent) / fullExtent;

    //sulle y non deve traslare
    canvas.translate(size.width * pageOffset, 0.0);
    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
