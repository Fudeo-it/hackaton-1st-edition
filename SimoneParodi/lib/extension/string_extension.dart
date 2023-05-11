extension StringExtension on String? {
  bool get isNullOrEmpty {
    return this == null || this!.trim().isEmpty;
  }

  bool get isEmail {
    if (this == null) {
      return false;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this!.trim());
  }
}
