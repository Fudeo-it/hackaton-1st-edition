import 'package:flutter/material.dart';

class BrandStyles {
  //https://medium.com/nerd-for-tech/flutter-defining-constants-the-right-way-321d33185b41
  // add a private constructor to prevent this class being instantiated
  // e.g. invoke `BrandStyles()` accidentally
  BrandStyles._();

  static BoxDecoration getBoxDecoration(ColorScheme colorScheme) {
    return BoxDecoration(
      color: colorScheme.surfaceVariant,
      boxShadow: [
        BoxShadow(
          color: colorScheme.primary.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 1,
        ),
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
    );
  }
}
