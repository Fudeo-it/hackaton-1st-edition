import 'package:annunci_lavoro_flutter/models/pagination.dart';
import 'package:annunci_lavoro_flutter/services/network/dto/job_positions_dto.dart';
import 'package:equatable/equatable.dart';

class JobsPositionsResponse extends Equatable {
  ///
  /// classe che gestisce la risposta del database degli annunci di tipo [JobPosition]
  ///
  final Map<String, String>? errors;
  final List<JobsPositionsAdsDTO> results;
  final Pagination pagination;
  const JobsPositionsResponse({
    required this.results,
    required this.errors,
    required this.pagination,
  });

  factory JobsPositionsResponse.fromJson(Map<String, dynamic> data) =>
      JobsPositionsResponse(
        errors: data.containsKey('errors') ? data['errors'] : null,
        results: (data['results'] as List)
            .map((item) =>
                JobsPositionsAdsDTO.fromJson(item as Map<String, dynamic>))
            .toList(growable: false),
        pagination: Pagination.fromJson(data),
      );

  @override
  List<Object?> get props => [
        errors,
        results,
      ];
}
