import 'package:job_app/core/data/mappers/base_mapper.dart';
import 'package:job_app/core/data/mappers/rich_text_mapper.dart';
import 'package:job_app/core/data/models/weblink_model.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/freelancers/data/mappers/nda_mapper.dart';
import 'package:job_app/features/freelancers/data/mappers/relazione_mapper.dart';
import 'package:job_app/features/freelancers/data/models/annuncio_freelancers_model.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/freelancers/presentation/pages/annunci_freelancers.dart';

import '../../../../core/domain/entities/weblink.dart';
import '../../../../core/services/service_locator.dart';

final _ndaMapper = NdaMapper();
final _relazioneMapper = RelazioneMapper();

final _modelToentityMapper = AnnuncioFreelancersMapper();

class AnnuncioFreelancersMapper
    extends EntityMapper<AnnuncioFreelancersModel, AnnuncioFreelancers> {
  @override
  AnnuncioFreelancersModel fromEntity(AnnuncioFreelancers entity) {
    return AnnuncioFreelancersModel(
        id: entity.id,
        titolo: entity.titolo,
        archived: entity.archived,
        tempistiche: entity.tempistiche.richTextModelList,
        tempistichePagamento: entity.tempistichePagamento.richTextModelList,
        richiestaDiLavoro: entity.richiestaDiLavoro.richTextModelList,
        descrizioneProgetto: entity.descrizioneProgetto.richTextModelList,
        budget: entity.budget.richTextModelList,
        jobPosted: entity.jobPosted,
        comeCandidarsi: WebLinkModel(
            content: entity.comeCandidarsi.content,
            url: entity.comeCandidarsi.url),
        emoji: entity.emoji,
        nda: sl<NdaMapper>().fromEntity(entity.nda),
        relazione: sl<RelazioneMapper>().fromEntity(entity.relazione),
        urlAnnuncio: entity.urlAnnuncio != null
            ? WebLinkModel(
                content: entity.urlAnnuncio!.content,
                url: entity.urlAnnuncio!.url)
            : null,
        tipoAnnuncio: entity.tipoAnnuncio);
  }

  @override
  AnnuncioFreelancers toEntity(AnnuncioFreelancersModel model) {
    return AnnuncioFreelancers(
      id: model.id,
      titolo: model.titolo,
      archived: model.archived,
      tempistiche: model.tempistiche.richTextList,
      tempistichePagamento: model.tempistichePagamento.richTextList,
      richiestaDiLavoro: model.richiestaDiLavoro.richTextList,
      descrizioneProgetto: model.descrizioneProgetto.richTextList,
      budget: model.budget.richTextList,
      jobPosted: model.jobPosted,
      nda: _ndaMapper.toEntity(model.nda),
      relazione: _relazioneMapper.toEntity(model.relazione),
      emoji: model.emoji,
      comeCandidarsi: WebLink(
        content: model.comeCandidarsi.content,
        url: model.comeCandidarsi.url,
      ),
      urlAnnuncio: model.urlAnnuncio != null
          ? WebLink(
              content: model.urlAnnuncio!.content, url: model.urlAnnuncio!.url)
          : null,
    );
  }
}

extension AnnuncioFreelExt on List<AnnuncioFreelancersModel> {
  AnnuncioFreelancerList get annuncioList =>
      map((e) => _modelToentityMapper.toEntity(e)).toList();
}
