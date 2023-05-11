import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/nullable_select_option_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/styled_text_mapper.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/dtos/notion_page_freelance_job_offer/notion_page_freelance_job_offer.dart';

class FreelanceJobOfferMapper extends DTOMapper<FreelanceJobOffer, NotionPageFreelanceJobOffer> {
  @override
  FreelanceJobOffer fromDTO(NotionPageFreelanceJobOffer notionPageFreelanceJobOffer) {
    NullableSelectOptionMapper nullableSelectOptionMapper = NullableSelectOptionMapper();
    StyledTextMapper styledTextMapper = StyledTextMapper();
    return FreelanceJobOffer(
      id: notionPageFreelanceJobOffer.id,
      archived: notionPageFreelanceJobOffer.archived,
      emoji: notionPageFreelanceJobOffer.icon?.maybeMap(emoji: (value) => value.emoji, orElse: () => null),
      url: notionPageFreelanceJobOffer.url,
      jobPosted: notionPageFreelanceJobOffer.properties.jobPosted?.createdTime,
      tempistiche: notionPageFreelanceJobOffer.properties.tempistiche?.richText.map(styledTextMapper.fromDTO).toList(),
      comeCandidarsi: notionPageFreelanceJobOffer.properties.comeCandidarsi?.richText.map(styledTextMapper.fromDTO).toList(),
      richiestaDiLavoro: notionPageFreelanceJobOffer.properties.richiestaDiLavoro?.richText.map(styledTextMapper.fromDTO).toList(),
      budget: notionPageFreelanceJobOffer.properties.budget?.richText.map(styledTextMapper.fromDTO).toList(),
      nda: nullableSelectOptionMapper.fromDTO(notionPageFreelanceJobOffer.properties.nda?.select),
      codice: notionPageFreelanceJobOffer.properties.codice?.title.map(styledTextMapper.fromDTO).toList(),
      tempisticheDiPagamento: notionPageFreelanceJobOffer.properties.tempisticheDiPagamento?.richText.map(styledTextMapper.fromDTO).toList(),
      descrizioneDelProgetto: notionPageFreelanceJobOffer.properties.descrizioneDelProgetto?.richText.map(styledTextMapper.fromDTO).toList(),
      tipoDiRelazione: nullableSelectOptionMapper.fromDTO(notionPageFreelanceJobOffer.properties.tipoDiRelazione?.select),
    );
  }

}