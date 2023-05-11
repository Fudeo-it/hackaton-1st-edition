import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/job_dto.dart';
import 'package:pine/dto/dto.dart';

class NotionResponse extends DTO with EquatableMixin {
  final String? object;
  final List<JobDTO> results;
  final String? nextCursor;
  final bool? hasMore;
  final String? type;
  final Object? page;

  NotionResponse({
    required this.object,
    required this.results,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  factory NotionResponse.fromJson(Map<String, dynamic> json) => NotionResponse(
        object: json[K.objectKey],
        results: json[K.resultsKey]
            .map<JobDTO>(
              (result) => JobDTO.fromJson(result),
            )
            .toList(growable: false),
        nextCursor: json[K.nextCursorKey],
        hasMore: json[K.hasMoreKey],
        type: json[K.typeKey],
        page: json[K.pageKey],
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
