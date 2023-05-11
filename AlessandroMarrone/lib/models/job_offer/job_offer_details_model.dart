import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_created_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_description_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_team_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_text_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_details/job_url_model.dart';

class JobOfferDetailsModel extends Equatable {
  final JobCreatedModel? jobCreatedTime;
  final JobSelectModel? team;
  final JobSelectModel? agreement;
  final JobSelectModel? seniority;
  final JobSelectModel? ral;
  final JobTextModel? jobPosition;
  final JobTextModel? jobQualification;
  final JobTextModel? jobSalary;
  final JobTextModel? nameCompany;
  final JobDescriptionModel jobDescription;
  final JobTextModel? howToApply;
  final JobTextModel? locality;
  final JobTextModel? jobPublicationStatus;
  final JobUrlModel? urlWebSiteCompany;

  const JobOfferDetailsModel({
    this.jobCreatedTime,
    this.team,
    this.agreement,
    this.seniority,
    this.ral,
    this.jobPosition,
    this.jobQualification,
    this.jobSalary,
    this.nameCompany,
    required this.jobDescription,
    this.howToApply,
    this.locality,
    this.jobPublicationStatus,
    this.urlWebSiteCompany,
  });

  @override
  List<Object?> get props => [
        jobCreatedTime,
        nameCompany,
        jobDescription,
        team,
        agreement,
        seniority,
        ral,
        jobPosition,
        jobQualification,
        jobSalary,
        howToApply,
        locality,
        jobPublicationStatus,
        urlWebSiteCompany,
      ];
}
