import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension GetSystemUIOverlay on SystemChrome {
  static SystemUiOverlayStyle getSystemUIOverlayStyle(BuildContext context) {
    final currentBrightnessType = Theme.of(context).brightness;

    if (currentBrightnessType == Brightness.light) {
      return SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      );
    }

    return SystemUiOverlayStyle.dark.copyWith(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
  }
}
