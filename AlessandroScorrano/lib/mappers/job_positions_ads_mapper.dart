import 'package:annunci_lavoro_flutter/misc/mapper.dart';
import 'package:annunci_lavoro_flutter/models/ads_description.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:annunci_lavoro_flutter/services/network/dto/job_positions_dto.dart';

class JobPositionsAdsMapper
    extends DTOMapper<JobsPositionsAdsDTO, JobPosition> {
  ///
  /// classe concreta del mapper [DTOMapper] che ritorna un oggetto di tipo [JobPosition]
  ///
  JobPositionsAdsMapper({required super.favouritesBloc});

  @override
  JobPosition toModel(JobsPositionsAdsDTO dto) => JobPosition(
        metaData: dto.metadata,
        adsTitle: dto.adsTitle,
        company: dto.company,
        jobLocation: _mapTeam(dto.jobLocation),
        postedDate: dto.postedDate,
        contractType: _mapContractType(dto.contractType),
        seniority: _mapSeniority(dto.seniority),
        workLocation: dto.workLocation,
        jobQualification: dto.jobQualification,
        remuneration: dto.remuneration,
        adsDescription: RichTextDescription(data: dto.adsDescription),
        applyLink: dto.applyLink,
        webSiteURL: dto.webSiteURL,
        adsUrl: dto.adsUrl,
        ral: dto.ral,
        isFavourite: favouritesBloc.isFavourite(dto.metadata.id),
      );

  @override
  JobsPositionsAdsDTO toTransferObject(JobPosition model) {
    throw UnimplementedError();
  }

  ContractType? _mapContractType(String? data) {
    switch (data) {
      case 'Full time':
        return ContractType.fullTime;

      case 'Part time':
        return ContractType.partTime;

      case null:
        return null;

      default:
        return null;
    }
  }

  Seniority? _mapSeniority(String? data) {
    switch (data) {
      case 'Junior':
        return Seniority.junior;

      case 'Mid':
        return Seniority.mid;

      case 'Senior':
        return Seniority.senior;

      case null:
        return null;

      default:
        return null;
    }
  }

  Team? _mapTeam(String? data) {
    switch (data) {
      case 'Ibrido':
        return Team.hybrid;

      case 'In sede':
        return Team.onSite;

      case 'Full Remote':
        return Team.remote;

      case null:
        return null;

      default:
        return null;
    }
  }
}
