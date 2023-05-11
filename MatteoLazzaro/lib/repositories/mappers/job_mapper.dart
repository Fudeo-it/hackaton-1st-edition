import 'package:offertelavoroflutter/misc/mapper.dart';
import 'package:offertelavoroflutter/models/job.dart';
import 'package:offertelavoroflutter/services/network/dto/job_dto.dart';

class JobMapper extends DTOMapper<JobDTO, Job> {
  @override
  Job toModel(JobDTO dto) => Job(
        name: dto.properties.name.text,
        qualifica: dto.properties.qualifica.text,
        nomeAzienda: dto.properties.nomeAzienda,
        team: _mapTeam(dto.properties.team.select),
        contratto: _mapContratto(dto.properties.contratto.select),
        seniority: _mapSeniority(dto.properties.seniority.select),
        retribuzione: dto.properties.retribuzione.text,
        descrizioneOfferta: dto.properties.descrizioneOfferta.text,
        comeCandidarsi: dto.properties.comeCandidarsi,
        localita: dto.properties.localita.text,
        urlSitoWeb: dto.properties.urlSitoWeb,
        jobPosted: dto.properties.jobPosted.createdTime,
      );

  @override
  JobDTO toTransferObject(Job model) {
    throw UnimplementedError();
  }

  Team? _mapTeam(String? team) {
    switch (team) {
      case 'In sede':
        return Team.inSede;
      case 'Ibrido':
        return Team.ibrido;
      case 'Full Remote':
        return Team.fullRemote;
    }

    return null;
  }

  Contratto? _mapContratto(String? contratto) {
    switch (contratto) {
      case 'In sede':
        return Contratto.fullTime;
      case 'Ibrido':
        return Contratto.partTime;
    }

    return null;
  }

  Seniority? _mapSeniority(String? seniority) {
    switch (seniority) {
      case 'In sede':
        return Seniority.junior;
      case 'Ibrido':
        return Seniority.mid;
      case 'Full Remote':
        return Seniority.senior;
    }

    return null;
  }
}
