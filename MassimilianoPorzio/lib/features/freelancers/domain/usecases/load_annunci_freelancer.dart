import 'package:dartz/dartz.dart';
import 'package:job_app/core/domain/usecases/base_usecase.dart';
import 'package:job_app/features/freelancers/domain/repositories/freelancers_repo.dart';

import '../../../../core/domain/errors/failures.dart';

class LoadAnnunciFreelancers extends BaseUseCase {
  FreelancersRepository repository;
  LoadAnnunciFreelancers({
    required this.repository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.loadAnnunciFreelancers(params);
  }
}
