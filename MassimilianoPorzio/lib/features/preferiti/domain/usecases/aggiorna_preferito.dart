import 'package:dartz/dartz.dart';

import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';
import 'package:job_app/features/preferiti/domain/repositories/preferiti_repo.dart';

class AggiornaPreferito extends BaseUseCase {
  PreferitiRepository repository;
  AggiornaPreferito({
    required this.repository,
  });

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.aggiornaPreferito(params);
  }
}
