part of 'job_offers_bloc.dart';

abstract class JobOffersState extends Equatable {
  const JobOffersState();

  @override
  List<Object?> get props => [];
}

class JobOffersFetching extends JobOffersState {}

class JobOffersFetched extends JobOffersState {
  final List<JobOfferModel> jobs;

  const JobOffersFetched({
    required this.jobs,
  });

  @override
  List<Object?> get props => [jobs];
}

class NoJobOffersFetched extends JobOffersState {}

class JobOffersError extends JobOffersState {
  final String? errorMessage;

  const JobOffersError({
    this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
