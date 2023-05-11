import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_details_model.dart';

class JobOfferModel extends Equatable {
  final String id;
  final DateTime? createdTime;
  final DateTime? lastEditedTime;
  final bool archived;
  final String postUrl;
  final JobOfferDetailsModel jobDetails;

  const JobOfferModel({
    required this.id,
    required this.createdTime,
    required this.lastEditedTime,
    required this.archived,
    required this.postUrl,
    required this.jobDetails,
  });

  @override
  List<Object?> get props =>
      [id, createdTime, lastEditedTime, archived, jobDetails, postUrl];
}
