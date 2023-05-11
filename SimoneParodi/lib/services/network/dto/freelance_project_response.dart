import 'package:offertelavoroflutter/services/network/dto/freelance_project_dto.dart';
import 'package:offertelavoroflutter/services/network/dto/job_offer_response.dart';

class FreelanceProjectResponse extends JobOfferResponse {
  final List<FreelanceProjectDTO> results;

  const FreelanceProjectResponse({
    required this.results,
    required super.object,
    required super.nextCursor,
    required super.hasMore,
    required super.type,
    required super.page,
  });

  factory FreelanceProjectResponse.fromJson(Map<String, dynamic> data) =>
      FreelanceProjectResponse(
        object: data['object'],
        results: (data['results'] as List)
            .map(
              (jobOfferDTO) => FreelanceProjectDTO.fromJson(
                  jobOfferDTO as Map<String, dynamic>),
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
