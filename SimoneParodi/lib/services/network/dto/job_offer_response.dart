import 'package:equatable/equatable.dart';

abstract class JobOfferResponse extends Equatable {
  final String object;
  final String? nextCursor;
  final bool hasMore;
  final String type;
  final Map<String, dynamic> page;

  const JobOfferResponse({
    required this.object,
    required this.nextCursor,
    required this.hasMore,
    required this.type,
    required this.page,
  });

  @override
  List<Object?> get props => [
        object,
        nextCursor,
        hasMore,
        type,
        page,
      ];
}
