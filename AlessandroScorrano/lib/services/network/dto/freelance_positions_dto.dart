import 'package:annunci_lavoro_flutter/misc/dto.dart';
import 'package:annunci_lavoro_flutter/models/matadata.dart';

class FreelancePositionsAdsDTO extends DTO {
  ///
  /// DTO per gli oggetti di tipo [FreeLancePosition]
  ///
  final List<dynamic> jobRequest;
  final List<dynamic> budget;
  final String nda;
  final List<dynamic> workTiming;
  final List<dynamic> paymentTimes;
  final String relationship;
  const FreelancePositionsAdsDTO({
    required super.metadata,
    required super.adsTitle,
    required super.applyLink,
    required super.postedDate,
    required super.adsUrl,
    required super.adsDescription,
    required this.jobRequest,
    required this.budget,
    required this.nda,
    required this.workTiming,
    required this.paymentTimes,
    required this.relationship,
  });

  factory FreelancePositionsAdsDTO.fromJson(Map<String, dynamic> data) =>
      FreelancePositionsAdsDTO(
        metadata: AdsMetaData.fromJson(data),
        adsTitle: DTO.getSingleText(data['properties']['Codice']) ?? '_',
        applyLink:
            DTO.getSingleText(data['properties']['Come candidarsi']) ?? '_',
        adsDescription: data['properties']['Descrizione del progetto']
            ['rich_text'],
        postedDate:
            DateTime.parse(data['properties']['Job Posted']['created_time']),
        jobRequest: data['properties']['Richiesta di lavoro']['rich_text'],
        budget: data['properties']['Budget']['rich_text'] ?? '-',
        nda: DTO.getSelectObject(data['properties']['NDA']['select']) ?? '-',
        workTiming: data['properties']['Tempistiche']['rich_text'] ?? '-',
        paymentTimes:
            data['properties']['Tempistiche di pagamento']['rich_text'] ?? '-',
        relationship: DTO.getSelectObject(
                data['properties']['Tipo di relazione']['select']) ??
            '-',
        adsUrl: data['url'],
      );

  @override
  List<Object?> get props => [
        ...super.props,
        jobRequest,
        budget,
        nda,
        workTiming,
        paymentTimes,
        relationship,
      ];
}
