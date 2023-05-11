import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';

class Job extends Equatable {
  final String id;
  final String emoji;
  final bool archived;
  final DateTime jobPosted;
  final TeamLocation team;
  final ContractType contract;
  final Seniority seniority;
  final String title;
  final String qualification;
  final String ral;
  final List<String> description;
  final String toApply;
  final String location;
  final String company;
  final String publicationStatus;
  final String website;

  const Job({
    required this.id,
    required this.emoji,
    required this.archived,
    required this.jobPosted,
    required this.team,
    required this.contract,
    required this.seniority,
    required this.title,
    required this.qualification,
    required this.ral,
    required this.description,
    required this.toApply,
    required this.location,
    required this.company,
    required this.publicationStatus,
    required this.website,
  });

  @override
  List<Object?> get props => [
        id,
        emoji,
        archived,
        jobPosted,
        team,
        contract,
        seniority,
        title,
        qualification,
        ral,
        description,
        toApply,
        location,
        company,
        publicationStatus,
        website,
      ];
}
