import 'package:dartz/dartz.dart';

import 'package:job_app/core/domain/errors/failures.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';
import 'package:job_app/features/aziende/domain/repositories/aziende_repository.dart';

class FetchAnnunciAzienda extends BaseUseCase {
  AziendeRepository repository;
  FetchAnnunciAzienda({
    required this.repository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    throw UnimplementedError();
  }
}
