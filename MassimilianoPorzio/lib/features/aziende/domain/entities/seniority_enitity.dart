import 'package:equatable/equatable.dart';

import '../enums/seniority.dart';

// import '../../utils/mixins.dart';

class SeniorityEntity extends Equatable {
  final Seniority seniority;
  final String? backgroundColorString;

  const SeniorityEntity({
    required this.seniority,
    this.backgroundColorString,
  });

  @override
  List<Object> get props => [seniority];

  @override
  bool? get stringify => true;
}
