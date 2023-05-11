import 'package:annunci_lavoro_flutter/misc/dto.dart';
import 'package:annunci_lavoro_flutter/models/matadata.dart';

class JobsPositionsAdsDTO extends DTO {
  ///
  /// DTO per gli oggetti di tipo [JobPosition]
  ///
  final String company;
  final String? jobLocation;
  final String? contractType;
  final String? seniority;
  final String jobQualification;
  final String? remuneration;
  final String workLocation;
  final String? webSiteURL;
  final String? ral;

  const JobsPositionsAdsDTO({
    required super.metadata,
    required super.adsTitle,
    required super.postedDate,
    required super.applyLink,
    required super.adsUrl,
    required super.adsDescription,
    required this.company,
    required this.jobLocation,
    required this.contractType,
    required this.seniority,
    required this.jobQualification,
    required this.remuneration,
    required this.workLocation,
    required this.webSiteURL,
    required this.ral,
  });
  factory JobsPositionsAdsDTO.fromJson(Map<String, dynamic> data) =>
      JobsPositionsAdsDTO(
          metadata: AdsMetaData.fromJson(data),
          company: DTO.getSingleText(data['properties']['Nome azienda']) ?? '-',
          jobLocation:
              DTO.getSelectObject(data['properties']['Team']['select']),
          postedDate:
              DateTime.parse(data['properties']['Job Posted']['created_time']),
          contractType:
              DTO.getSelectObject(data['properties']['Contratto']['select']),
          seniority:
              DTO.getSelectObject(data['properties']['Seniority']['select']),
          adsTitle: DTO.getSingleText(data['properties']['Name']) ?? '-',
          jobQualification:
              DTO.getSingleText(data['properties']['Qualifica']) ?? '-',
          remuneration:
              DTO.getSingleText(data['properties']['Retribuzione']) ?? '-',
          adsDescription: data['properties']['Descrizione offerta']
              ['rich_text'],
          workLocation:
              DTO.getSingleText(data['properties']['Località']) ?? '-',
          applyLink:
              DTO.getSingleText(data['properties']['Come candidarsi']) ?? '-',
          webSiteURL: data['properties']['URL sito web']['url'],
          adsUrl: data['url'],
          ral: DTO.getSelectObject(data['properties']['RAL']['select']));

  @override
  List<Object?> get props => [
        ...super.props,
        company,
        jobLocation,
        contractType,
        seniority,
        jobLocation,
        remuneration,
        workLocation,
        webSiteURL,
      ];
}
