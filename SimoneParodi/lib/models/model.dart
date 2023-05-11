import 'package:equatable/equatable.dart';

class Model extends Equatable {
  final String id;

  const Model({
    required this.id,
  });

  @override
  List<Object?> get props => [
        id,
      ];
}
