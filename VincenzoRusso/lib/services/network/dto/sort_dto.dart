import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:pine/pine.dart';

class SortsDTO extends DTO with EquatableMixin {
  final String name,
      seniority,
      team,
      contract,
      ral,
      nda,
      relationship,
      budget,
      paymentTiming,
      timelines;

  const SortsDTO({
    this.name = "",
    this.seniority = "",
    this.team = "",
    this.contract = "",
    this.ral = "",
    this.nda = "",
    this.relationship = "",
    this.budget = "",
    this.paymentTiming = "",
    this.timelines = "",
  });

  bool get isNotEmpty =>
      name.isNotEmpty ||
      seniority.isNotEmpty ||
      team.isNotEmpty ||
      contract.isNotEmpty ||
      ral.isNotEmpty ||
      nda.isNotEmpty ||
      relationship.isNotEmpty ||
      budget.isNotEmpty ||
      paymentTiming.isNotEmpty ||
      timelines.isNotEmpty;

  List<Map<String, dynamic>> toJson() => [
        if (name.isNotEmpty)
          {
            K.propertyKey: K.namePropertyKey,
            K.directionKey: name,
          },
        if (seniority.isNotEmpty)
          {
            K.propertyKey: K.seniorityKey,
            K.directionKey: seniority,
          },
        if (team.isNotEmpty)
          {
            K.propertyKey: K.teamKey,
            K.directionKey: team,
          },
        if (contract.isNotEmpty)
          {
            K.propertyKey: K.contractKey,
            K.directionKey: contract,
          },
        if (ral.isNotEmpty)
          {
            K.propertyKey: K.retribuzioneKey,
            K.directionKey: ral,
          },
        if (nda.isNotEmpty)
          {
            K.propertyKey: K.ndaKey,
            K.directionKey: nda,
          },
        if (relationship.isNotEmpty)
          {
            K.propertyKey: K.tipoDiRelazioneKey,
            K.directionKey: relationship,
          },
        if (budget.isNotEmpty)
          {
            K.propertyKey: K.budgetKey,
            K.directionKey: budget,
          },
        if (paymentTiming.isNotEmpty)
          {
            K.propertyKey: K.tempisticheDiPagamentoKey,
            K.directionKey: paymentTiming,
          },
        if (timelines.isNotEmpty)
          {
            K.propertyKey: K.tempisticeKey,
            K.directionKey: timelines,
          },
      ];

  @override
  List<Object?> get props => [
        name,
        seniority,
        team,
        contract,
        ral,
        nda,
        relationship,
        budget,
        paymentTiming,
        timelines,
      ];
}
