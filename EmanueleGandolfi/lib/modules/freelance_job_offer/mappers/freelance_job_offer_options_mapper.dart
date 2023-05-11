import 'package:offertelavoroflutter_app/helpers/dto_mapper.dart';
import 'package:offertelavoroflutter_app/modules/common/mappers/select_option_mapper.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer_options/freelance_job_offer_options.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/dtos/notion_db_freelance_job_offer/notion_db_freelance_job_offer.dart';

class FreelanceJobOfferOptionsMapper extends DTOMapper<FreelanceJobOfferOptions, NotionDbFreelanceJobOffer> {
  @override
  FreelanceJobOfferOptions fromDTO(NotionDbFreelanceJobOffer notionDbFreelanceJobOffer) {
    SelectOptionMapper selectOptionMapper = SelectOptionMapper();
    return FreelanceJobOfferOptions(
      nda: notionDbFreelanceJobOffer.properties.nda?.select.options.map(selectOptionMapper.fromDTO).toList(),
      tipoDiRelazione: notionDbFreelanceJobOffer.properties.tipoDiRelazione?.select.options.map(selectOptionMapper.fromDTO).toList(),
    );
  }
}