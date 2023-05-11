import 'dart:ui';

import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

enum Seniority {
  junior,
  mid,
  senior,
  undefined,
}

extension SeniorityExtension on Seniority {
  String get getString {
    switch (this) {
      case Seniority.junior:
        return "Junior";
      case Seniority.mid:
        return "Mid";
      case Seniority.senior:
        return "Senior";
      case Seniority.undefined:
        return "Non disponibile";
    }
  }

  Color get color {
    switch (this) {
      case Seniority.junior:
        return AppColors.tagGreen;
      case Seniority.mid:
        return AppColors.tagYellow;
      case Seniority.senior:
        return AppColors.tagRed;
      case Seniority.undefined:
        return AppColors.transparent;
    }
  }

  Color get colorText {
    switch (this) {
      case Seniority.junior:
        return AppColors.tagTextGreen;
      case Seniority.mid:
        return AppColors.tagTextYellow;
      case Seniority.senior:
        return AppColors.tagTextRed;
      case Seniority.undefined:
        return AppColors.tagTextGray;
    }
  }
}
