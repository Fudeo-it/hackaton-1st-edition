import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/services/network/dto/job_dto.dart';

class JobAnnouncementsResponse extends Equatable {
  final Map<String, String>? errors;
  final String object;
  final List<JobDTO> results;
  final String? nextCursor;
  final bool hasMore;
  final String type;
  final String? page;

  const JobAnnouncementsResponse({
    required this.errors,
    required this.object,
    required this.results,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  factory JobAnnouncementsResponse.fromJson(Map<String, dynamic> data) =>
      JobAnnouncementsResponse(
        errors: data.containsKey('errors') && data['errors'] is Map
            ? data['errors']
            : null,
        object: data['object'],
        results: (data['results'] as List)
            .map((item) => JobDTO.fromJson(item as Map<String, dynamic>))
            .toList(growable: false),
        nextCursor: data['next_cursor'],
        hasMore: data['has_more'],
        type: data['type'],
        page: PageDTO.fromJson(data['page']).text,
      );

  @override
  List<Object?> get props => [
        errors,
        object,
        results,
        nextCursor,
        hasMore,
        type,
        page,
      ];
}

class PageDTO extends Equatable {
  final String? text;

  const PageDTO({required this.text});

  factory PageDTO.fromJson(Map<String, dynamic> data) {
    return PageDTO(text: null);
    if (data == null) {}
    String? lista = data as String;
    return PageDTO(text: lista);
  }

  @override
  List<Object?> get props => [text];
}
