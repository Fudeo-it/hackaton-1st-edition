import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  // Colors
  static const Color kPrimaryColor = Color(0xFF027DFD);
  static const Color kSecondaryColor = Colors.grey;
  static const Color kFlutterBlue = Color(0xFF0553B1);
  static const Color kFlutterNavy = Color(0xFF042B59);
  static const Color kScaffold = Color(0xFFF8F8F8);
  static const Color kTextColor = Color(0xFF231F1C);
  static const Color kErrorColor = Color(0xFFB00020);
  static const Color kSuccessColor = Color(0xFF00C853);
  static const Color kWarningColor = Color(0xFFFFAB00);
  static const Color kInfoColor = Color(0xFF2962FF);
  static const Color kWhite = Color(0xFFFFFFFF);

  // Paddings
  static const double kPadding = 20.0;
  static const EdgeInsets kPaddingAll = EdgeInsets.all(kPadding);
  static const EdgeInsets kPaddingH =
      EdgeInsets.symmetric(horizontal: kPadding);
  static const EdgeInsets kPaddingV = EdgeInsets.symmetric(vertical: kPadding);

  // InputDecorations
  static const InputDecoration kInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 16,
    ),
    border: OutlineInputBorder(
      borderRadius: kBorderRadius,
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 0,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: kBorderRadius,
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: kBorderRadius,
      borderSide: BorderSide(
        color: kSecondaryColor,
        width: 0,
      ),
    ),
  );

  // Radius
  static const Radius kRadius = Radius.circular(16);

  // Borders
  static const BorderRadius kBorderRadius = BorderRadius.all(kRadius);

  // Shapes
  static const RoundedRectangleBorder kRoundedRectangleBorder =
      RoundedRectangleBorder(borderRadius: kBorderRadius);
  // Text Styles
  static TextStyle kBigTitle = GoogleFonts.montserrat(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: kTextColor,
  );

  static TextStyle kTitle = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: kTextColor,
  );

  static TextStyle kSubtitle = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: kTextColor,
  );

  static TextStyle kBody = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: kTextColor,
  );

  static TextStyle kBodyBold = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: kTextColor,
  );

  static TextStyle kButton = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: kWhite,
  );
}
