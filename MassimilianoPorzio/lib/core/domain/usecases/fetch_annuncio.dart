import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';

class AnnuncioParam extends Equatable {
  final String annuncioId;
  //SERVE PER I FILTRI
  final String? searchTerm;
  const AnnuncioParam({
    required this.annuncioId,
    this.searchTerm,
  });

  @override
  List<Object?> get props => [annuncioId, searchTerm];
}

class FetchAnnuncio extends BaseUseCase {
  @override
  Future<Either<Failure, dynamic>> call(params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
