import 'package:offertelavoroflutter_it_app/models/job_project/job_project_details_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/utilities/mapper_utilities.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:pine/pine.dart';

class JobProjectsMapper extends DTOMapper<JobsResponse, JobProjectModel> {
  @override
  JobProjectModel fromDTO(JobsResponse dto) => JobProjectModel(
        id: dto.id,
        createdTime: DateTime.tryParse(dto.createdTime),
        lastEditedTime: DateTime.tryParse(dto.lastEditedTime),
        archived: dto.archived,
        postUrl: dto.url,
        projectDetails: JobProjectDetailsModel(
          jobCreatedTime: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_posted)
              .first),
          jobRequirement: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_request)
              .first),
          timing: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_timing)
              .first),
          howToApply: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_howtoapply)
              .first),
          jobBudget: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_budget)
              .first),
          nda: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_nda)
              .first),
          jobTitle: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_title)
              .first),
          paymentTimes: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_paymenttimes)
              .first),
          jobDescription: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_projectdescription)
              .first),
          employRelationship: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_relationship)
              .first),
        ),
      );

  @override
  JobsResponse toDTO(JobProjectModel model) => throw UnimplementedError();
}
