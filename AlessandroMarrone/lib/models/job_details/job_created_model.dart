import 'package:equatable/equatable.dart';

class JobCreatedModel extends Equatable {
  final DateTime created;

  const JobCreatedModel({
    required this.created,
  });
  @override
  List<Object?> get props => [created];
}
