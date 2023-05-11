import '../../../../app/resources/string_constants.dart';

enum Relazione {
  solo(value: 0),
  altri(value: 1);

  const Relazione({required this.value});
  final int value;
  String toJson() => name;
  static Relazione fromJson(String json) => values.byName(json);

  @override
  String toString() {
    switch (this) {
      case Relazione.solo:
        return StringConsts.relazioneSolo;
      case Relazione.altri:
        return StringConsts.relazioneAltri;
      default:
        return StringConsts.defaultUndefined;
    }
  }
}
