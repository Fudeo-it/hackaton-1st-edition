enum SortType {
  ascending,
  descending,
  none,
}

extension SortTypeExtension on SortType {
  String get getString {
    switch (this) {
      case SortType.ascending:
        return "Cres.";
      case SortType.descending:
        return "Decre.";
      case SortType.none:
        return "No";
    }
  }
}
