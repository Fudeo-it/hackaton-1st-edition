import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:pine/pine.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_details_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/utilities/mapper_utilities.dart';
import 'package:offertelavoroflutter_it_app/services/network/dto/jobs_response.dart';

class JobOffersMapper extends DTOMapper<JobsResponse, JobOfferModel> {
  @override
  JobOfferModel fromDTO(JobsResponse dto) => JobOfferModel(
        id: dto.id,
        createdTime: DateTime.tryParse(dto.createdTime),
        lastEditedTime: DateTime.tryParse(dto.lastEditedTime),
        archived: dto.archived,
        postUrl: dto.url,
        jobDetails: JobOfferDetailsModel(
          jobCreatedTime: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_posted)
              .first),
          team: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_team)
              .first),
          agreement: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_agreement)
              .first),
          seniority: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_seniority)
              .first),
          ral: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_ral)
              .first),
          jobPosition: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_position)
              .first),
          jobQualification: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_qualification)
              .first),
          jobSalary: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext.current.label_field_json_job_salary)
              .first),
          nameCompany: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_companyname)
              .first),
          jobDescription: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_description)
              .first),
          howToApply: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_howtoapply)
              .first),
          locality: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_locality)
              .first),
          jobPublicationStatus: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_pubblicationstatus)
              .first),
          urlWebSiteCompany: MapperUtilities().getMapping(dto.properties
              .where((property) =>
                  property.nameField ==
                  AppLocalizationsNoContext
                      .current.label_field_json_job_urlcompany)
              .first),
        ),
      );

  @override
  JobsResponse toDTO(JobOfferModel model) => throw UnimplementedError();
}
