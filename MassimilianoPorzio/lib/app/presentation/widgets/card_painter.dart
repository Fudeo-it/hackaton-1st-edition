import 'dart:math';

import 'package:flutter/material.dart';

class CardPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var cornerRadius = size.height * 0.25;
    //il raggio piccolo è 1/5 del corner
    double radius = 0.2 * cornerRadius;

    //il raggio grande è 2 volte quello piccolo
    double radius2 = 2 * radius;
    var paint = Paint();
    paint.strokeWidth = 2.0;
    paint.style = PaintingStyle.stroke;
    // TODO: Set properties to paint

    var path = Path()
          ..lineTo(size.width - cornerRadius, 0)
          //faccio arco di cerchio a scendere in verticale
          ..arcTo(
              Rect.fromCircle(
                  center: Offset(size.width - cornerRadius, cornerRadius),
                  radius: cornerRadius),
              1.5 * pi,
              0.5 * pi, //quanto mi muovo
              false) //non parte con l'arco
          // //Muovo in verticale in basso al corner complicato
          ..lineTo(size.width, size.height - cornerRadius)
          // //primo quarto di cerchio a rientrare verso sinistra
          // //con raggio 1/4 del cornerRadius
          ..arcTo(
              Rect.fromCircle(
                  center:
                      Offset(size.width - radius, size.height - cornerRadius),
                  radius: radius),
              0 * pi,
              0.5 * pi,
              false)
          // ..moveTo(size.width - step, size.height - step)
          // // //parte con l'arco
          ..arcTo(
              Rect.fromCircle(
                  center: Offset(size.width - 0.5 * cornerRadius,
                      size.height - 0.5 * cornerRadius),
                  radius: radius2),
              0.25 * pi,
              1.5 * pi,
              true)
        // ..moveTo(size.width - radius, size.height - radius)
        // // //parte con l'arco
        // ..arcTo(
        //     Rect.fromCircle(
        //         center: Offset(size.width - radius, size.height), radius: radius),
        //     1.5 * pi,
        //     0.5 * pi,
        //     false)
        // ..lineTo(size.width, size.height)
        ;

    // TODO: Draw your path

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
