import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

class MyTheme {
  static const _fontFamily = 'Montserrat';
  static const _useMaterial3 = true;
  static Color placeholderColorForShimmer = Colors.white;
  static const _lightColorScheme = ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xFF9DA5E0),
    secondary: Colors.black45,
    tertiary: Color.fromARGB(255, 228, 162, 70),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    shadow: Color(0xFF000000),
  );

  static const _darkColorScheme = ColorScheme.dark(
    brightness: Brightness.dark,
    primary: Color(0xFFBBC3FF),
    secondary: Colors.white54,
    tertiary: Color.fromARGB(255, 239, 184, 108),
    error: Color(0xFFFFB4AB),
    shadow: Color(0xFF000000),
    background: Color.fromARGB(255, 36, 39, 45),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: _fontFamily,
      useMaterial3: _useMaterial3,
      colorScheme: _lightColorScheme,
      appBarTheme: _appBarTheme(
        shadowColor: _lightColorScheme.shadow,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: _fontFamily,
      useMaterial3: _useMaterial3,
      colorScheme: _darkColorScheme,
      appBarTheme: _appBarTheme(
        shadowColor: _darkColorScheme.shadow,
      ),
    );
  }

  static AppBarTheme _appBarTheme({
    required Color shadowColor,
  }) =>
      AppBarTheme(
        centerTitle: true,
        elevation: 5,
        shadowColor: shadowColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(MyRadius.l),
            bottomRight: Radius.circular(MyRadius.l),
          ),
        ),
      );
}
