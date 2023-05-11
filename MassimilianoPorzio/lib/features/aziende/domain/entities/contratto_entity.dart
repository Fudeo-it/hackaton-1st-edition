import 'package:equatable/equatable.dart';
import 'package:job_app/features/aziende/domain/enums/contratto.dart';

class ContrattoEntity extends Equatable {
  final Contratto contratto;
  final String? backgroundColorString;

  const ContrattoEntity({
    required this.contratto,
    this.backgroundColorString,
  });

  @override
  List<Object> get props => [contratto];

  @override
  bool? get stringify => true;
}
