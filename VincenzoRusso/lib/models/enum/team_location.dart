import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

enum TeamLocation {
  fullRemote,
  hybrid,
  onSite,
  undefined,
}

extension TeamLocationExtension on TeamLocation {
  String get getString {
    switch (this) {
      case TeamLocation.fullRemote:
        return "Full Remote";
      case TeamLocation.hybrid:
        return "Ibrido";
      case TeamLocation.onSite:
        return "In sede";
      case TeamLocation.undefined:
        return "Non disponibile";
    }
  }

  Color get color {
    switch (this) {
      case TeamLocation.fullRemote:
        return AppColors.tagPurple;
      case TeamLocation.hybrid:
        return AppColors.tagYellow;
      case TeamLocation.onSite:
        return AppColors.tagRed;
      case TeamLocation.undefined:
        return AppColors.transparent;
    }
  }

  Color get colorText {
    switch (this) {
      case TeamLocation.fullRemote:
        return AppColors.tagTextPurple;
      case TeamLocation.hybrid:
        return AppColors.tagTextYellow;
      case TeamLocation.onSite:
        return AppColors.tagTextRed;
      case TeamLocation.undefined:
        return AppColors.tagTextGray;
    }
  }
}
