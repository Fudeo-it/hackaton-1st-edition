import 'package:dartz/dartz.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';

import '../../../../core/domain/errors/failures.dart';
import '../repositories/preferiti_repo.dart';

class AggiungiPreferito extends BaseUseCase {
  PreferitiRepository repository;
  AggiungiPreferito({
    required this.repository,
  });

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.aggiungiPreferito(params);
  }
}
