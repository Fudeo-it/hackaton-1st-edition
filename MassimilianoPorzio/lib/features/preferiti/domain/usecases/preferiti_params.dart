import 'package:equatable/equatable.dart';

import '../entities/preferito.dart';

class PreferitiParams extends Equatable {
  final Preferito preferito;
  const PreferitiParams({
    required this.preferito,
  });

  @override
  List<Object> get props => [preferito];

  PreferitiParams copyWith({
    Preferito? preferito,
  }) {
    return PreferitiParams(
      preferito: preferito ?? this.preferito,
    );
  }
}
