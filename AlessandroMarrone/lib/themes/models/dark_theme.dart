import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class DarkTheme {
  static get make => ThemeData(
        fontFamily: "Montserrat",
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(K.primaryColor),
            overlayColor: const MaterialStatePropertyAll(K.secondaryColor),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: const MaterialStatePropertyAll(K.primaryColor),
          checkColor: const MaterialStatePropertyAll(K.accentColor),
          side: const BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0.0,
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white.withOpacity(0.38),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2.0),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          border: InputBorder.none,
        ),
      );
}
