import 'package:dartz/dartz.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';
import 'package:job_app/features/preferiti/domain/repositories/preferiti_repo.dart';

import '../../../../core/domain/errors/failures.dart';

class OttieniPreferiti extends BaseUseCase {
  PreferitiRepository repository;
  OttieniPreferiti({
    required this.repository,
  });

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.fetchListaPreferiti(params);
  }
}
