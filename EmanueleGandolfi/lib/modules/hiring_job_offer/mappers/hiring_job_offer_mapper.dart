import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/nullable_select_option_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/styled_text_mapper.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/dtos/notion_page_hiring_job_offer/notion_page_hiring_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';

class HiringJobOfferMapper extends DTOMapper<HiringJobOffer, NotionPageHiringJobOffer>{
  @override
  HiringJobOffer fromDTO(NotionPageHiringJobOffer notionPageHiringJobOffer) {
    NullableSelectOptionMapper nullableSelectOptionMapper = NullableSelectOptionMapper();
    StyledTextMapper styledTextMapper = StyledTextMapper();
    return HiringJobOffer(
      id: notionPageHiringJobOffer.id,
      archived: notionPageHiringJobOffer.archived,
      emoji: notionPageHiringJobOffer.icon?.maybeMap(emoji: (value) => value.emoji, orElse: () => null),
      url: notionPageHiringJobOffer.url,
      jobPosted: notionPageHiringJobOffer.properties.jobPosted?.createdTime,
      team: nullableSelectOptionMapper.fromDTO(notionPageHiringJobOffer.properties.team?.select),
      contratto: nullableSelectOptionMapper.fromDTO(notionPageHiringJobOffer.properties.contratto?.select),
      seniority: nullableSelectOptionMapper.fromDTO(notionPageHiringJobOffer.properties.seniority?.select),
      ral: nullableSelectOptionMapper.fromDTO(notionPageHiringJobOffer.properties.ral?.select),
      name: notionPageHiringJobOffer.properties.name?.title.map(styledTextMapper.fromDTO).toList(),
      qualifica: notionPageHiringJobOffer.properties.qualifica?.richText.map(styledTextMapper.fromDTO).toList(),
      retribuzione: notionPageHiringJobOffer.properties.retribuzione?.richText.map(styledTextMapper.fromDTO).toList(),
      descrizioneOfferta: notionPageHiringJobOffer.properties.descrizioneOfferta?.richText.map(styledTextMapper.fromDTO).toList(),
      comeCandidarsi: notionPageHiringJobOffer.properties.comeCandidarsi?.richText.map(styledTextMapper.fromDTO).toList(),
      localita: notionPageHiringJobOffer.properties.localita?.richText.map(styledTextMapper.fromDTO).toList(),
      nomeAzienda: notionPageHiringJobOffer.properties.nomeAzienda?.richText.map(styledTextMapper.fromDTO).toList(),
      statoDiPubblicazione: notionPageHiringJobOffer.properties.statoDiPubblicazione?.richText.map(styledTextMapper.fromDTO).toList(),
      urlSitoWeb: notionPageHiringJobOffer.properties.urlSitoWeb?.url
    );
  }
}