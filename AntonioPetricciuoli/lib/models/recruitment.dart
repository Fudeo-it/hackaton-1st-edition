import 'package:equatable/equatable.dart';

class Recruitment extends Equatable {
  final String? id;
  final String? icon;
  final String? name;
  final String? company;
  final String? location;
  final String? seniority;
  final String? ral;
  final String? contract;
  final String? team;
  final String? offerDescription;
  final bool? isSaved;
  final String? date;
  final String? howToApply;

  const Recruitment({
    this.id,
    this.icon,
    this.name,
    this.company,
    this.location,
    this.seniority,
    this.ral,
    this.contract,
    this.team,
    this.offerDescription,
    this.isSaved,
    this.date,
    this.howToApply,
  });

  Recruitment copyWith({
    String? id,
    String? icon,
    String? name,
    String? company,
    String? location,
    String? seniority,
    String? ral,
    String? contract,
    String? team,
    String? offerDescription,
    bool? isSaved,
    String? date,
    String? howToApply,
  }) {
    return Recruitment(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      name: name ?? this.name,
      company: company ?? this.company,
      location: location ?? this.location,
      seniority: seniority ?? this.seniority,
      ral: ral ?? this.ral,
      contract: contract ?? this.contract,
      team: team ?? this.team,
      offerDescription: offerDescription ?? this.offerDescription,
      isSaved: isSaved ?? this.isSaved,
      date: date ?? this.date,
      howToApply: howToApply ?? this.howToApply,
    );
  }

  @override
  List<Object?> get props => [
        id,
        icon,
        name,
        company,
        location,
        seniority,
        ral,
        contract,
        team,
        offerDescription,
        isSaved,
        date,
        howToApply,
      ];
}
