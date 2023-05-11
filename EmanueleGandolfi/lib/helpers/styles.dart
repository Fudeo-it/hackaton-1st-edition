import 'package:flutter/material.dart';

class Styles {
  // Colors
  static const Color primaryDark = Color(0xFF061D5C);
  static const Color primaryLight = Color(0xFF027DFD);
  static const Color accent = Color(0xFFFFDE59);
  static const Color lightText = Color(0xFFA0A7B1);
  static const Color lightBackground = Color(0xFFF9F9F9);
  static const Color darkBackground = Color(0xFF141218);
  static const Color darkSurface = Color(0xFF211F26);
  static Color lightShadow = const Color(0xFF99ABC6).withAlpha(45);
  static Color darkShadow = const Color(0xFF36343B).withAlpha(45);

  // Other
  static const double screenHorizPadding = 20;

  // Button themes
  static ButtonStyle? getLightButtonTheme(BuildContext context) => Theme.of(context).elevatedButtonTheme.style?.copyWith(
    backgroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.tertiary),
    foregroundColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.onTertiary)
  );

  static ButtonStyle? getAccentButtonTheme(BuildContext context) => Theme.of(context).elevatedButtonTheme.style?.copyWith(
    backgroundColor: const MaterialStatePropertyAll(Styles.accent),
    foregroundColor: const MaterialStatePropertyAll(Styles.primaryDark)
  );
}