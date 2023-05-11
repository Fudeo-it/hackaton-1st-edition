import 'package:equatable/equatable.dart';

import 'package:job_app/features/freelancers/domain/enums/relazione.dart';

class RelazioneEntity extends Equatable {
  final Relazione relazione;
  final String? backgroundColorString;

  const RelazioneEntity({
    required this.relazione,
    this.backgroundColorString,
  });

  @override
  List<Object> get props => [relazione];

  @override
  bool? get stringify => true;
}
