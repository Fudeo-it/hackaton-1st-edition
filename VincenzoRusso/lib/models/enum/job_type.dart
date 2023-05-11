enum JobType {
  office,
  freelance,
}

extension JobTypeExtension on JobType {
  String get getString {
    switch (this) {
      case JobType.office:
        return "In ufficio";
      case JobType.freelance:
        return "Frrelance";
    }
  }
}
