import 'package:flutter/material.dart';

import '../../app/resources/color_manager.dart';
import '../../app/resources/string_constants.dart';

mixin NotionColor {
  Color getBackgroundColor(ThemeMode mode, String notionColor) {
    bool isDark = mode == ThemeMode.dark;
    ColorScheme colorScheme = isDark
        ? ColorManager.defaultDarkColorScheme
        : ColorManager.defaultLightColorScheme;
    switch (notionColor) {
      case StringConsts.notionBlue:
        return isDark
            ? ColorManager.notionDarkBlue
            : ColorManager.notionLightBlue;
      case StringConsts.notionYellow:
        return isDark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;
      case StringConsts.notionRed:
        return isDark
            ? ColorManager.notionDarkRed
            : ColorManager.notionLightRed;
      case StringConsts.notionGreen:
        return isDark
            ? ColorManager.notionDarkGreen
            : ColorManager.notionLightGreen;
      case StringConsts.notionGray:
        return isDark
            ? ColorManager.notionDarkGray
            : ColorManager.notionLightGray;
      case StringConsts.notionPurple:
        return isDark
            ? ColorManager.notionDarkPurple
            : ColorManager.notionLightPurple;
      default:
        return colorScheme.primary;
    }
  }

  Color getForegroundColor(ThemeMode mode, String notionColor) {
    bool isDark = mode == ThemeMode.dark;
    ColorScheme colorScheme = isDark
        ? ColorManager.defaultDarkColorScheme
        : ColorManager.defaultLightColorScheme;
    switch (notionColor) {
      case StringConsts.notionBlue:
        return isDark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightBlue;
      case StringConsts.notionYellow:
        return isDark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightYellow;
      case StringConsts.notionRed:
        return isDark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightRed;
      case StringConsts.notionGreen:
        return isDark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightGreen;
      case StringConsts.notionGray:
        return isDark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightGray;
      case StringConsts.notionPurple:
        return isDark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightPurple;
      default:
        return colorScheme.onPrimary;
    }
  }
}
