import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';
import 'package:offertelavoroflutter_app/services/network/dto/filter_dto.dart';
import 'package:offertelavoroflutter_app/services/network/dto/sort_dto.dart';
import 'package:pine/pine.dart';

class QueryNotionRequest extends DTO with EquatableMixin {
  final int? pageSize;
  final String? startCursor;
  final FiltersDTO? filters;
  final SortsDTO? sorts;

  QueryNotionRequest({
    this.pageSize,
    this.startCursor,
    this.filters,
    this.sorts,
  });

  Map<String, dynamic> toJson() => {
        if (pageSize != null) K.pageSizeKey: pageSize,
        if (startCursor != null) K.startCursorKey: startCursor,
        if (filters != null && filters!.isNotEmpty)
          K.filterKey: filters!.toJson(),
        if (sorts != null && sorts!.isNotEmpty) K.sortKey: sorts!.toJson(),
      };

  @override
  List<Object?> get props => [
        pageSize,
        startCursor,
        filters,
        sorts,
      ];
}
