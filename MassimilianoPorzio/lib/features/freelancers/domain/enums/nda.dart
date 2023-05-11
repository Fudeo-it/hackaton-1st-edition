import 'package:job_app/app/resources/string_constants.dart';

enum NDA {
  si(value: 1),
  no(value: 0);

  const NDA({required this.value});
  final int value;
  String toJson() => name;
  static NDA fromJson(String json) => values.byName(json);

  @override
  String toString() {
    switch (this) {
      case NDA.no:
        return StringConsts.ndaNo;
      case NDA.si:
        return StringConsts.ndaSi;
      default:
        return StringConsts.defaultUndefined;
    }
  }
}
