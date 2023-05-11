import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';

class JobSort<T extends JobPosition> {
  /// oggetto per gestire i criteri di ordinamento degli oggetti [JobPosition]
  final dynamic Function(T) attributeGetter;
  bool ascending;
  late String attribute;

  JobSort({
    required this.attributeGetter,
    required this.ascending,
  }) {
    attribute = attributeGetter.toString();
  }
}

class FreelanceSort<T extends FreeLancePosition> {
  /// oggetto per gestire i criteri di ordinamento degli oggetti [FreeLancePosition]
  final dynamic Function(T) attributeGetter;
  bool ascending;
  late String attribute;

  FreelanceSort({
    required this.attributeGetter,
    required this.ascending,
  }) {
    attribute = attributeGetter.toString();
  }
}
