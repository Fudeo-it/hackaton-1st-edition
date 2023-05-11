import 'package:job_app/app/resources/string_constants.dart';

enum Seniority implements Comparable<Seniority> {
  junior(value: 0),
  mid(value: 1),
  senior(value: 2);

  const Seniority({required this.value});

  final int value;

  String toJson() => name;
  static Seniority fromJson(String json) => values.byName(json);

  @override
  int compareTo(Seniority other) => value - other.value;

  @override
  String toString() {
    super.toString();
    switch (this) {
      case Seniority.junior:
        return StringConsts.seniorityJunior;
      case Seniority.mid:
        return StringConsts.seniorityMid;
      case Seniority.senior:
        return StringConsts.senioritySenior;
      default:
        return StringConsts.seniorityDefault;
    }
  }
}
