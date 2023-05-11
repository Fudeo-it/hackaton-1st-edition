import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/failures.dart';
import '../../../../core/domain/usecases/base_usecase.dart';
import '../repositories/aziende_repository.dart';

class RefreshAnnunciAzienda extends BaseUseCase {
  AziendeRepository repository;
  RefreshAnnunciAzienda({
    required this.repository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.refreshAnnunciAziende(params);
  }
}
