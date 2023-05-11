import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_details_model.dart';

class JobProjectModel extends Equatable {
  final String id;
  final DateTime? createdTime;
  final DateTime? lastEditedTime;
  final bool archived;
  final String postUrl;
  final JobProjectDetailsModel projectDetails;

  const JobProjectModel({
    required this.id,
    this.createdTime,
    this.lastEditedTime,
    required this.archived,
    required this.postUrl,
    required this.projectDetails,
  });

  @override
  List<Object?> get props =>
      [id, createdTime, lastEditedTime, archived, projectDetails, postUrl];
}
