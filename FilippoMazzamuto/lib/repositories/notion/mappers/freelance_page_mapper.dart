import 'package:collection/collection.dart';
import 'package:offertelavoroflutter/misc/mapper.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page_properties.dart';

/// The mapping is done with data from Notion
class FreelancePageMapper extends DTOMapper<PageDTO, Freelance> {
  @override
  PageDTO toDataTransfertObject(Freelance model) {
    throw UnimplementedError();
  }

  @override
  Freelance toModel(PageDTO dto) {
    // If you change or add new properties on notion just change or add new values ​​here
    Map<String, PagePropertiesDTO?> properties = dto.properties.property;
    return Freelance(
      id: dto.id,
      target: TargetJobOffer.freelance,
      name: (properties['Codice'] as TitleDTO?)?.title.firstOrNull?.plainText,
      image: dto.icon?.emoji,
      posted: (properties['Job Posted'] as CreatedTimeDTO?)?.createdTime,
      archived: dto.archived,
      candidature: (properties['Come candidarsi'] as RichTextDTO?)?.richText.firstOrNull?.plainText,
      workRequest: (properties['Richiesta di lavoro'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      relationshipType: Detail.toModel(properties['Tipo di relazione'] as SelectDTO?),
      nda: Detail.toModel(properties['NDA'] as SelectDTO?),
      timing: (properties['Tempistiche'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      budget: (properties['Budget'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      paymentTimes: (properties['Tempistiche di pagamento'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      projectDescription: (properties['Descrizione del progetto'] as RichTextDTO?)?.richText
        .map((item) => Description.toModel(item)).toList(growable: false),
      url: dto.url,
    );
  }

}