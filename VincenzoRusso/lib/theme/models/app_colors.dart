import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Colori Tag
  static const tagBlue = Color(0xFFD3E5EF);
  static const tagTextBlue = Color(0xFF1E394C);
  static const tagGreen = Color(0xFFDBEDDB);
  static const tagTextGreen = Color(0xFF1B382A);
  static const tagGray = Color(0xFFE3E2E0);
  static const tagTextGray = Color(0xFF32302C);
  static const tagPurple = Color(0xFFE7DEEE);
  static const tagTextPurple = Color(0xFF412354);
  static const tagRed = Color(0xFFFFE2DD);
  static const tagTextRed = Color(0xFF5C1815);
  static const tagYellow = Color(0xFFFDECC7);
  static const tagTextYellow = Color(0xFF533F2C);

  // Colori App
  static const primaryLight = Color(0xFF027DFD);
  static const primaryDark = Color(0xFF061D5C);
  static const accent = Color(0xFFFFDE59);
  static const white = Color(0xFFFFFFFF);
  static const whiteBg = Color(0xFFFBFBFB);
  static const transparent = Colors.transparent;
  static const lightGray = Color(0xFFF1F1F1);
  static const gray = Color(0xFF888888);
  static const dividerGray = Color(0xFFE8E8E8);
  static const black = Color(0xFF333333);
  static const blackBg = Color(0xFF303030);
  static const red = Color(0xFFF03C50);
  static const lightRed = Color(0xFFFF5C5C);

  // Gradienti
  static const RadialGradient primaryGradient = RadialGradient(
    colors: [
      primaryDark,
      primaryLight,
    ],
    stops: [0, 1],
    center: Alignment.topLeft,
    radius: 1.9,
  );
}
