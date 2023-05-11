import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/typedefs.dart';
import '../../../../core/domain/errors/failures.dart';
import '../entities/annuncio_freelancer.dart';
import '../usecases/annunci_freelancer_params.dart';

abstract class FreelancersRepository {
  Future<Either<Failure, AnnuncioFreelancerList>> loadAnnunciFreelancers(
      AnnunciFreelancersParams params);
  Future<Either<Failure, AnnuncioFreelancerList>> refreshAnnunciFreelancers(
      AnnunciFreelancersParams params);
  Future<Either<Failure, AnnuncioFreelancers>> fetchAnnuncioFreelancers(
      AnnunciFreelancersParams params);
}
