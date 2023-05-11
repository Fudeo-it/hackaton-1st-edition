import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';

class JobFreelance extends Equatable {
  final String id;
  final String emoji;
  final bool archived;
  final DateTime jobPosted;
  final String timelines;
  final String toApply;
  final List<String> jobApplication;
  final String budget;
  final bool nda;
  final String code;
  final String paymentTiming;
  final List<String> description;
  final Relationship relationship;

  const JobFreelance({
    required this.id,
    required this.emoji,
    required this.archived,
    required this.jobPosted,
    required this.timelines,
    required this.toApply,
    required this.jobApplication,
    required this.budget,
    required this.nda,
    required this.code,
    required this.paymentTiming,
    required this.description,
    required this.relationship,
  });

  @override
  List<Object?> get props => [
        id,
        emoji,
        archived,
        jobPosted,
        timelines,
        toApply,
        jobApplication,
        budget,
        nda,
        code,
        paymentTiming,
        description,
        relationship,
      ];
}
