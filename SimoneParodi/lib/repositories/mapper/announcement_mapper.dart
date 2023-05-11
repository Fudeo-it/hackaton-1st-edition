import 'package:offertelavoroflutter/misc/mapper.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/models/announcement.dart';
import 'package:offertelavoroflutter/services/network/dto/announcement_dto.dart';

class AnnouncementMapper extends DTOMapper<AnnouncementDTO, Announcement> {
  @override
  Announcement toModel(AnnouncementDTO dto) => Announcement(
        id: dto.id,
        name: dto.properties.name.title.first.text.content,
        companyName: dto.properties.companyName.allText,
        webSiteUrl: dto.properties.websiteUrl.url,
        qualification: dto.properties.qualification.allText,
        seniority: _seniorityMap(dto.properties.seniority.select?.name),
        team: _teamMap(dto.properties.team.select?.name),
        contract: _contractMap(dto.properties.contract.select?.name),
        salary: dto.properties.salary.allText,
        ral: dto.properties.ral.select?.name,
        desription: dto.properties.description.richText
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
        howToApply: FormattedText(
          text: dto.properties.howToApply.richText.first.text.content,
          url: dto.properties.howToApply.richText.first.text.link,
        ),
        postedOn: DateTime.parse(
          dto.properties.jobPosted.createdTime,
        ),
        location: dto.properties.location.allText,
        url: dto.url,
      );

  @override
  AnnouncementDTO toTransfertObject(Announcement model) {
    throw UnimplementedError();
  }

  Seniority? _seniorityMap(String? seniority) {
    switch (seniority?.toLowerCase().trim()) {
      case 'senior':
        return Seniority.senior;
      case 'mid':
        return Seniority.mid;
      case 'junior':
        return Seniority.junior;
      default:
        return null;
    }
  }

  Team? _teamMap(String? team) {
    switch (team?.toLowerCase().trim()) {
      case 'ibrido':
        return Team.hybrid;
      case 'in sede':
        return Team.office;
      case 'full remote':
        return Team.remote;
      default:
        return null;
    }
  }

  Contract? _contractMap(String? contract) {
    switch (contract?.toLowerCase().trim()) {
      case 'full time':
        return Contract.fullTime;
      case 'part time':
        return Contract.partTime;
      default:
        return null;
    }
  }
}
