import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

class ThemeManager {
  static ThemeData getLightTheme(ColorScheme? lightDynamic) {
    return ThemeData(
        useMaterial3: true,
        fontFamily: FontConstants.fontFamily,
        // appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade200),
        colorScheme: lightDynamic ?? ColorManager.defaultLightColorScheme);
  }

  static ThemeData getDarkTheme(ColorScheme? darktDynamic) {
    return ThemeData(
      colorScheme: darktDynamic ?? ColorManager.defaultDarkColorScheme,
      useMaterial3: true,
      fontFamily: FontConstants.fontFamily,
      // textTheme: TextTheme(
      //   displayLarge: StyleManager.getSemiBoldStyle(fontSize: 28),
      //   displayMedium: StyleManager.getMediumStyle(fontSize: 24),
      //   displaySmall: StyleManager.getRegularStyle(fontSize: 22),
      //   headlineLarge: StyleManager.getSemiBoldStyle(fontSize: 20),
      //   headlineMedium: StyleManager.getMediumStyle(fontSize: 18),
      //   headlineSmall: StyleManager.getRegularStyle(fontSize: 16),
      //   titleLarge: StyleManager.getSemiBoldStyle(fontSize: FontSize.s14),
      //   titleMedium: StyleManager.getMediumStyle(),
      //   titleSmall: StyleManager.getMediumStyle(),
      //   bodyLarge: StyleManager.getRegularStyle(),
      //   bodyMedium: StyleManager.getMediumStyle(),
      //   bodySmall: StyleManager.getRegularStyle(),
      // ),
    );
  }
}
