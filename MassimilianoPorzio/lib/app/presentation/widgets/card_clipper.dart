import 'dart:math';

import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    //size è della card
    //il corner è 1/4 dell'altezza (quadrato)
    var cornerRadius = size.height * 0.25;
    //il raggio piccolo è 1/5 del corner
    double radius = 0.2 * cornerRadius;
    //il raggio grande è 2 volte quello piccolo
    double radius2 = 2 * radius;

    //parto in alto a sinistra dopo il corner
    Path path = Path()
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
          ..moveTo(size.width - radius, size.height - radius)
          // //parte con l'arco
          ..arcTo(
              Rect.fromCircle(
                  center: Offset(size.width - 0.5 * cornerRadius,
                      size.height - 0.5 * cornerRadius),
                  radius: radius2),
              0.75 * pi,
              pi,
              false) //non andare all'inzio dell'arco
        // //spostati ora
        // //ultimo pezzetto di arco per arrivare al fondo
        // ..arcTo(
        //     Rect.fromPoints(
        //       Offset(size.width - cornerRadius, size.height - radius),
        //       Offset(size.width - cornerRadius + radius, size.height),
        //     ),
        //     0,
        //     0.5 * pi,
        //     false) //non unire all'inizio dell'arco
        // //ora linea orizz in basso a tornare al corner in basso a sin
        // ..lineTo(radius, size.height)
        ;
    //ora arco ad andare in verticale sul bordo sinistro

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
