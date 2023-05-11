import 'dart:ui';

import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

enum Relationship {
  onlyWithJobCommissioners,
  otherProfessionist,
  undefined,
}

extension RelationshipExtension on Relationship {
  String get getString {
    switch (this) {
      case Relationship.onlyWithJobCommissioners:
        return "Solo con chi commissiona il lavoro";
      case Relationship.otherProfessionist:
        return "Con altri professionisti";
      case Relationship.undefined:
        return "Non disponibile";
    }
  }

  Color get color {
    switch (this) {
      case Relationship.onlyWithJobCommissioners:
        return AppColors.tagRed;
      case Relationship.otherProfessionist:
        return AppColors.tagGray;
      case Relationship.undefined:
        return AppColors.transparent;
    }
  }

  Color get colorText {
    switch (this) {
      case Relationship.onlyWithJobCommissioners:
        return AppColors.tagTextRed;
      case Relationship.otherProfessionist:
        return AppColors.tagTextGray;
      case Relationship.undefined:
        return AppColors.tagTextGray;
    }
  }
}
