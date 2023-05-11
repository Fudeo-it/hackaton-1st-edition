extension ExtensionToShortString on Enum {
  String toShortString() {
    return toString().split('.').last;
  }
}