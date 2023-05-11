//https://dart.dev/guides/language/effective-dart/design#avoid-defining-a-class-that-contains-only-static-members
import 'package:flutter/material.dart';

class BrandColors {
  //https://medium.com/nerd-for-tech/flutter-defining-constants-the-right-way-321d33185b41
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `BrandColors()` accidentally
  BrandColors._();

  static Color redColor = Color(int.parse('FFF25D50', radix: 16));
  static Color yellowColor = Color(int.parse('FFFFF275', radix: 16));
  static Color purpleColor = Color(int.parse('FF6200EE', radix: 16));
  static Color greenColor = Color(int.parse('FF1CDAC5', radix: 16));
}
