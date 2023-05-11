import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/job.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:pine/pine.dart';

class JobMapper extends DTOMapper<JobDTO, Job> {
  @override
  Job fromDTO(JobDTO dto) => Job(
        id: dto.id ?? '',
        emoji: dto.icon?.emoji ?? '',
        archived: dto.archived ?? false,
        jobPosted: dto.properties?.jobPosted?.createdTime != null
            ? DateTime.tryParse(dto.properties!.jobPosted!.createdTime) ??
                DateTime.fromMillisecondsSinceEpoch(0)
            : DateTime.fromMillisecondsSinceEpoch(0),
        team: TeamLocation.values.firstWhere((team) =>
            team.getString ==
            (dto.properties?.team?.select?.name ?? "Non disponibile")),
        contract: ContractType.values.firstWhere((contract) =>
            contract.getString ==
            (dto.properties?.contratto?.select?.name ?? "Non disponibile")),
        seniority: Seniority.values.firstWhere((seniority) =>
            seniority.getString ==
            (dto.properties?.seniority?.select?.name ?? "Non disponibile")),
        title: (dto.properties?.name?.title
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(' '),
        qualification: (dto.properties?.qualifica?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        ral: (dto.properties?.retribuzione?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        description: dto.properties?.descrizioneOfferta?.richText
                .map((e) => e.plainText ?? '')
                .toList(growable: false) ??
            [],
        toApply: (dto.properties?.comeCandidarsi?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        location: (dto.properties?.localita?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        company: (dto.properties?.nomeAzienda?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        publicationStatus: (dto.properties?.statoDiPubblicazione?.richText
                    .map((e) => e.plainText ?? '')
                    .toList(growable: false) ??
                [])
            .join(" "),
        website: dto.properties?.urlSitoWeb?.url ?? '',
      );

  @override
  JobDTO toDTO(Job model) {
    throw UnimplementedError();
  }
}
