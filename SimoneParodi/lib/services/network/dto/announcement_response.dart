import 'package:offertelavoroflutter/services/network/dto/announcement_dto.dart';
import 'package:offertelavoroflutter/services/network/dto/job_offer_response.dart';

class AnnouncementResponse extends JobOfferResponse {
  final List<AnnouncementDTO> results;

  const AnnouncementResponse({
    required this.results,
    required super.object,
    required super.nextCursor,
    required super.hasMore,
    required super.type,
    required super.page,
  });

  factory AnnouncementResponse.fromJson(Map<String, dynamic> data) =>
      AnnouncementResponse(
        object: data['object'],
        results: (data['results'] as List)
            .map(
              (jobOfferDTO) =>
                  AnnouncementDTO.fromJson(jobOfferDTO as Map<String, dynamic>),
            )
            .toList(growable: false),
        nextCursor: data['next_cursor'],
        hasMore: data['has_more'],
        type: data['type'],
        page: data['page'] as Map<String, dynamic>,
      );

  @override
  List<Object?> get props => [
        ...super.props,
        results,
      ];
}
