import 'dart:ui';

import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

enum ContractType {
  fullTime,
  partTime,
  undefined,
}

extension ContractTypeExtension on ContractType {
  String get getString {
    switch (this) {
      case ContractType.fullTime:
        return "Full time";
      case ContractType.partTime:
        return "Part time";
      case ContractType.undefined:
        return "Non disponibile";
    }
  }

  Color get color {
    switch (this) {
      case ContractType.fullTime:
        return AppColors.tagBlue;
      case ContractType.partTime:
        return AppColors.tagGray;
      case ContractType.undefined:
        return AppColors.transparent;
    }
  }

  Color get colorText {
    switch (this) {
      case ContractType.fullTime:
        return AppColors.tagTextBlue;
      case ContractType.partTime:
        return AppColors.tagTextGray;
      case ContractType.undefined:
        return AppColors.tagTextGray;
    }
  }
}
