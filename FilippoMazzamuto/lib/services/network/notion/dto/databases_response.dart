import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/services/network/notion/dto/page.dart';

class DatabasesResponse extends Equatable {
  final String object;
  final List<PageDTO> results;
  final String? nextCursor;
  final bool hasMore;
  final String type;
  final Object page;

  const DatabasesResponse({
    required this.object,
    required this.results,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  factory DatabasesResponse.fromJson(Map<String, dynamic> data) => 
    DatabasesResponse(
      object: data['object'],
      results: (data['results'] as List)
        .map((item) => PageDTO.fromJson(item as Map<String, dynamic>))
        .toList(growable: false),
      nextCursor: data['next_cursor'],
      hasMore: data['has_more'],
      type: data['type'],
      page: data['page'],
    );

  @override
  List<Object?> get props => [
    object,
    results,
    nextCursor,
    hasMore,
    type,
    page,
  ];
}