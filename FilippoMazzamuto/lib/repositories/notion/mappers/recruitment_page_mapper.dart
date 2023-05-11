import 'package:collection/collection.dart';
import 'package:offertelavoroflutter/misc/mapper.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page_properties.dart';

/// The mapping is done with data from Notion
class RecruitmentPageMapper extends DTOMapper<PageDTO, Recruitment> {
  @override
  PageDTO toDataTransfertObject(Recruitment model) {
    throw UnimplementedError();
  }

  @override
  Recruitment toModel(PageDTO dto) {
    // If you change or add new properties on notion just change or add new values ​​here
    Map<String, PagePropertiesDTO?> properties = dto.properties.property;
    return Recruitment(
      id: dto.id,
      target: TargetJobOffer.recruitment,
      name: (properties['Name'] as TitleDTO?)?.title.firstOrNull?.plainText,
      image: dto.icon?.emoji,
      posted: (properties['Job Posted'] as CreatedTimeDTO?)?.createdTime,
      archived: dto.archived,
      candidature: (properties['Come candidarsi'] as RichTextDTO?)?.richText.firstOrNull?.plainText,
      companyName: (properties['Nome azienda'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      urlWebsite: (properties['URL sito web'] as UrlDTO?)?.url,
      qualification: (properties['Qualifica'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      seniority: Detail.toModel(properties['Seniority'] as SelectDTO?),
      team: Detail.toModel(properties['Team'] as SelectDTO?),
      contract: Detail.toModel(properties['Contratto'] as SelectDTO?),
      pay: (properties['Retribuzione'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      ral: (properties['RAL'] as SelectDTO?)?.selectOption?.name,
      offerDescription: (properties['Descrizione offerta'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      locality: (properties['Località'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      url: dto.url,
    );
  }


  @Deprecated("Questo metodo non viene più utilizzato, sostituito con Map<String, PagePropertiesDTO>")
  T? getPropertyByFieldAndType<T extends PagePropertiesDTO>(List<PagePropertiesDTO> properties, String field) {
    final property = properties.whereType<T>().firstWhereOrNull((item) => item.field == field);
    return property;
  }

}