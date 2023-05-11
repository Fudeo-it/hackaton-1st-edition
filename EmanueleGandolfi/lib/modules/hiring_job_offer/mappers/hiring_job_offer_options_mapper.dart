import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/select_option_mapper.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/dtos/notion_db_hiring_job_offer/notion_db_hiring_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer_options/hiring_job_offer_options.dart';

class HiringJobOfferOptionsMapper extends DTOMapper<HiringJobOfferOptions, NotionDbHiringJobOffer> {
  @override
  HiringJobOfferOptions fromDTO(NotionDbHiringJobOffer notionDbHiringJobOffer) {
    SelectOptionMapper selectOptionMapper = SelectOptionMapper();
    return HiringJobOfferOptions(
      team: notionDbHiringJobOffer.properties.team?.select.options.map(selectOptionMapper.fromDTO).toList(),
      contratto: notionDbHiringJobOffer.properties.contratto?.select.options.map(selectOptionMapper.fromDTO).toList(),
      seniority: notionDbHiringJobOffer.properties.seniority?.select.options.map(selectOptionMapper.fromDTO).toList(),
      ral: notionDbHiringJobOffer.properties.ral?.select.options.map(selectOptionMapper.fromDTO).toList(),
    );
  }
}