import 'package:annunci_lavoro_flutter/models/pagination.dart';
import 'package:annunci_lavoro_flutter/services/network/dto/freelance_positions_dto.dart';
import 'package:equatable/equatable.dart';

class FreelancePositionsresponse extends Equatable {
  ///
  /// classe che gestisce la risposta del database degli annunci di tipo [FreeLancePosition]
  ///
  final Map<String, String>? errors;
  final Pagination pagination;
  final List<FreelancePositionsAdsDTO> results;

  const FreelancePositionsresponse({
    required this.errors,
    required this.results,
    required this.pagination,
  });

  factory FreelancePositionsresponse.fromJson(Map<String, dynamic> data) =>
      FreelancePositionsresponse(
        errors: data.containsKey('errors') ? data['errors'] : null,
        results: (data['results'] as List)
            .map(
              (item) => FreelancePositionsAdsDTO.fromJson(
                  item as Map<String, dynamic>),
            )
            .toList(growable: false),
        pagination: Pagination.fromJson(data),
      );

  @override
  List<Object?> get props => [
        errors,
        results,
      ];
}
