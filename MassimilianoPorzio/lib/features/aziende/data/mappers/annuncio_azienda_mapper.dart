import 'dart:math';

import 'package:job_app/core/data/mappers/base_mapper.dart';
import 'package:job_app/core/data/mappers/rich_text_mapper.dart';
import 'package:job_app/core/data/models/weblink_model.dart';

import 'package:job_app/features/aziende/domain/entities/annuncio_azienda.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';

import '../../../../core/domain/entities/weblink.dart';
import '../../../../core/services/service_locator.dart';
import 'contratto_mapper.dart';
import 'seniority_mapper.dart';
import 'team_mapper.dart';
import '../models/annuncio_azienda_model.dart';

final _teamMapper = TeamMapper();
final _contrattoMapper = ContrattoMapper();
final _seniorityMapper = SeniorityMapper();

final _modelToEntityMapper = AnnuncioAziendaMapper();

class AnnuncioAziendaMapper
    extends EntityMapper<AnnuncioAziendaModel, AnnuncioAzienda> {
  @override
  AnnuncioAziendaModel fromEntity(AnnuncioAzienda entity) {
    return AnnuncioAziendaModel(
        id: entity.id,
        titolo: entity.titolo,
        nomeAzienda: WebLinkModel(
            content: entity.nomeAzienda.content, url: entity.nomeAzienda.url),
        descrizioneOfferta: entity.descrizioneOfferta.richTextModelList,
        comeCandidarsi: WebLinkModel(
            content: entity.comeCandidarsi.content,
            url: entity.comeCandidarsi.url),
        jobPosted: entity.jobPosted,
        archived: entity.archived,
        tipoAnnuncio: entity.tipoAnnuncio,
        contratto: sl<ContrattoMapper>().fromEntity(entity.contratto),
        seniority: sl<SeniorityMapper>().fromEntity(entity.seniority),
        team: sl<TeamMapper>().fromEntity(entity.team),
        qualifica: entity.qualifica,
        retribuzione: entity.retribuzione,
        localita: entity.localita,
        emoji: entity.emoji,
        urlAnnuncio: entity.urlAnnuncio != null
            ? WebLinkModel(
                content: entity.urlAnnuncio!.content,
                url: entity.urlAnnuncio!.url)
            : null);
  }

  @override
  AnnuncioAzienda toEntity(AnnuncioAziendaModel model) {
    return AnnuncioAzienda(
      id: model.id,
      titolo: model.titolo,
      qualifica: model.qualifica,
      nomeAzienda: WebLink(
        content: model.nomeAzienda.content,
        url: model.nomeAzienda.url,
      ),
      team: _teamMapper.toEntity(model.team),
      contratto: _contrattoMapper.toEntity(model.contratto),
      seniority: _seniorityMapper.toEntity(model.seniority),
      retribuzione: model.retribuzione,
      descrizioneOfferta: model.descrizioneOfferta.richTextList,
      comeCandidarsi: WebLink(
        content: model.comeCandidarsi.content,
        url: model.comeCandidarsi.url,
      ),
      localita: model.localita,
      emoji: model.emoji,
      jobPosted: model.jobPosted,
      archived: model.archived,
      urlAnnuncio: model.urlAnnuncio != null
          ? WebLink(
              content: model.urlAnnuncio!.content, url: model.urlAnnuncio!.url)
          : null,
    );
  }
}

extension AnnuncioAzExt on List<AnnuncioAziendaModel> {
  AnnuncioAziendaList get annuncioList =>
      map((e) => _modelToEntityMapper.toEntity(e)).toList();
}
