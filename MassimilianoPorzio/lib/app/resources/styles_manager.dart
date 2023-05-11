import 'package:flutter/material.dart';

import 'font_manager.dart';

class StyleManager {
  static TextStyle _getTextStyle(
      {required double fontSize,
      required String fontFamily,
      required FontWeight fontWeight,
      Color? color}) {
    return TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight);
  }

//*regular style
  static TextStyle getRegularStyle(
      {double fontSize = FontSize.s12, Color? color}) {
    return _getTextStyle(
        fontSize: fontSize,
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontWeight: FontWeightManager.regular);
  }

//*light text style
  static TextStyle getLightStyle(
      {double fontSize = FontSize.s12, Color? color}) {
    return _getTextStyle(
        fontSize: fontSize,
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontWeight: FontWeightManager.light);
  }

//*bold text style
  static TextStyle getBoldStyle(
      {double fontSize = FontSize.s12, Color? color}) {
    return _getTextStyle(
        fontSize: fontSize,
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontWeight: FontWeightManager.bold);
  }

//*semibold text style
  static TextStyle? getSemiBoldStyle(
      {double fontSize = FontSize.s12, Color? color}) {
    return _getTextStyle(
        fontSize: fontSize,
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontWeight: FontWeightManager.semiBold);
  }

//*medium text style
  static TextStyle getMediumStyle(
      {double fontSize = FontSize.s12, Color? color}) {
    return _getTextStyle(
        fontSize: fontSize,
        fontFamily: FontConstants.fontFamily,
        color: color,
        fontWeight: FontWeightManager.medium);
  }
}
