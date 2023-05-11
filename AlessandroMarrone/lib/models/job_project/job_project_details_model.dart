import 'package:equatable/equatable.dart';

import 'package:offertelavoroflutter_it_app/models/job_details/job_created_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_description_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_team_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_text_model.dart';

class JobProjectDetailsModel extends Equatable {
  final JobCreatedModel jobCreatedTime;
  final JobTextModel? timing;
  final JobTextModel? howToApply;
  final JobDescriptionModel jobRequirement;
  final JobTextModel? jobBudget;
  final JobSelectModel? nda;
  final JobTextModel? jobTitle;
  final JobTextModel? paymentTimes;
  final JobDescriptionModel? jobDescription;
  final JobSelectModel? employRelationship;

  const JobProjectDetailsModel({
    required this.jobCreatedTime,
    this.timing,
    this.howToApply,
    required this.jobRequirement,
    this.jobBudget,
    this.nda,
    this.jobTitle,
    this.paymentTimes,
    this.jobDescription,
    this.employRelationship,
  });

  @override
  List<Object?> get props => [
        jobCreatedTime,
        timing,
        howToApply,
        jobRequirement,
        jobBudget,
        nda,
        jobTitle,
        paymentTimes,
        jobDescription,
        employRelationship,
      ];
}
