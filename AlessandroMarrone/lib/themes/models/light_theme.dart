import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class LightTheme {
  static const primaryColor = K.primaryColor;
  static const secondaryColor = K.secondaryColor;
  static const accentColor = K.accentColor;

  static get make => ThemeData(
        primaryColor: primaryColor,
        fontFamily: "Montserrat",
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: primaryColor,
          ),
        ),
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
        tabBarTheme: const TabBarTheme(
          labelColor: accentColor,
          unselectedLabelColor: primaryColor,
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          labelStyle: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          elevation: 0.0,
          backgroundColor: Colors.white,
          selectedItemColor: primaryColor,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: primaryColor.withOpacity(0.38),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: K.secondaryColor.withOpacity(0.10), width: 2.0),
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          border: InputBorder.none,
        ),
      );
}
