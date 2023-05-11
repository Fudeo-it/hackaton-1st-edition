import 'package:dartz/dartz.dart';
import 'package:job_app/features/freelancers/domain/repositories/freelancers_repo.dart';

import '../../../../core/domain/errors/failures.dart';
import '../../../../core/domain/usecases/base_usecase.dart';

class RefreshAnnunciFreelancer extends BaseUseCase {
  FreelancersRepository repository;
  RefreshAnnunciFreelancer({
    required this.repository,
  });
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return repository.refreshAnnunciFreelancers(params);
  }
}
