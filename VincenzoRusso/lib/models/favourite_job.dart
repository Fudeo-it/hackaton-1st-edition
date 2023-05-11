import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/models/enum/job_type.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';

class FavouriteJob extends Equatable {
  final String id;
  final String company;
  final String position;
  final String emoji;
  final JobType jobType;

  const FavouriteJob({
    required this.id,
    this.company = '',
    this.position = '',
    this.emoji = '',
    required this.jobType,
  });

  factory FavouriteJob.fromJob(Job job) => FavouriteJob(
        id: job.id,
        company: job.company,
        position: job.qualification.isNotEmpty ? job.qualification : job.title,
        jobType: JobType.office,
        emoji: job.emoji,
      );

  factory FavouriteJob.fromFreelance(JobFreelance job) => FavouriteJob(
        id: job.id,
        position: job.code,
        jobType: JobType.freelance,
        emoji: job.emoji,
      );

  @override
  List<Object?> get props => [
        id,
        company,
        position,
        jobType,
        emoji,
      ];
}
