import 'package:offertelavoroflutter/misc/mapper.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';
import 'package:offertelavoroflutter/services/network/dto/freelance_project_dto.dart';

class FreelanceProjectMapper
    extends DTOMapper<FreelanceProjectDTO, FreelanceProject> {
  @override
  FreelanceProject toModel(FreelanceProjectDTO dto) => FreelanceProject(
        id: dto.id,
        timing: dto.properties.timing.allText,
        postedOn: DateTime.parse(
          dto.properties.jobPosted.createdTime,
        ),
        howToApply: FormattedText(
          text: dto.properties.howToApply.richText.first.text.content,
          url: dto.properties.howToApply.richText.first.text.link,
        ),
        jobRequest: dto.properties.jobRequest.richText
            .map(
              (e) => FormattedText(
                text: e.text.content,
                url: e.text.link,
                bold: e.annotations.bold,
                italic: e.annotations.italic,
                strikethrough: e.annotations.strikethrough,
                underline: e.annotations.underline,
              ),
            )
            .toList(growable: false),
        budget: dto.properties.budget.allText,
        nda: _ndaMap(dto.properties.nda.select?.name),
        title: dto.properties.code.title.first.text.content,
        paymentTimes: dto.properties.paymentTimes.allText,
        description: dto.properties.description.richText
            .map(
              (e) => FormattedText(
                text: e.text.content,
                url: e.text.link,
                bold: e.annotations.bold,
                italic: e.annotations.italic,
                strikethrough: e.annotations.strikethrough,
                underline: e.annotations.underline,
              ),
            )
            .toList(growable: false),
        typeRelationship:
            _typeRelationshipMap(dto.properties.typeRelationship.select?.name),
        url: dto.url,
      );

  @override
  FreelanceProjectDTO toTransfertObject(FreelanceProject model) {
    throw UnimplementedError();
  }

  Nda? _ndaMap(String? nda) {
    switch (nda?.toLowerCase().trim()) {
      case 'si':
        return Nda.si;
      case 'no':
        return Nda.no;
      default:
        return null;
    }
  }

  TypeRelationship? _typeRelationshipMap(String? typeRelationship) {
    switch (typeRelationship?.toLowerCase().trim()) {
      case 'solo con chi commissiona il lavoro':
        return TypeRelationship.commissions;
      case 'con altri professionisti':
        return TypeRelationship.freelance;
      default:
        return null;
    }
  }
}
