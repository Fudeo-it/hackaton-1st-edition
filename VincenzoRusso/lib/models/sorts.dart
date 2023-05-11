import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/enum/sort_type.dart';

class Sorts extends Equatable {
  final SortType name,
      seniority,
      team,
      contract,
      ral,
      nda,
      relationship,
      budget,
      paymentTiming,
      timelines;

  const Sorts({
    this.name = SortType.none,
    this.seniority = SortType.none,
    this.team = SortType.none,
    this.contract = SortType.none,
    this.ral = SortType.none,
    this.nda = SortType.none,
    this.relationship = SortType.none,
    this.budget = SortType.none,
    this.paymentTiming = SortType.none,
    this.timelines = SortType.none,
  });

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
