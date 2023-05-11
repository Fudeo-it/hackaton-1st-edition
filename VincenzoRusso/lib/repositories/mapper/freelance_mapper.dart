import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/job_freelance.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:pine/pine.dart';

class FreelanceMapper extends DTOMapper<JobDTO, JobFreelance> {
  @override
  JobFreelance fromDTO(JobDTO dto) => JobFreelance(
        id: dto.id ?? '',
        emoji: dto.icon?.emoji ?? '',
        archived: dto.archived ?? false,
        jobPosted: dto.properties?.jobPosted?.createdTime != null
            ? DateTime.tryParse(dto.properties!.jobPosted!.createdTime) ??
                DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.fromMillisecondsSinceEpoch(0),
        timelines: (dto.properties?.tempistiche?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        toApply: (dto.properties?.comeCandidarsi?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        jobApplication: dto.properties?.richiestaDiLavoro?.richText
                .map((e) => e.plainText ?? '')
                .toList(growable: false) ??
            [],
        budget: (dto.properties?.budget?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        nda: (dto.properties?.nda?.select?.name ?? 'no').toLowerCase() == "no"
            ? false
            : true,
        code: (dto.properties?.codice?.title
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        paymentTiming: (dto.properties?.tempisticheDiPagamento?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        description: dto.properties?.descrizioneDelProgetto?.richText
                .map((e) => e.plainText ?? '')
                .toList(growable: false) ??
            [],
        relationship: Relationship.values.firstWhere(
          (relationship) =>
              relationship.getString ==
              (dto.properties?.tipoDiRelazione?.select?.name ??
                  "Non disponibile"),
        ),
      );

  @override
  JobDTO toDTO(JobFreelance model) {
    throw UnimplementedError();
  }
}
