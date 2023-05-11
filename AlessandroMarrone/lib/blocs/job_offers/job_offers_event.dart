part of 'job_offers_bloc.dart';

abstract class JobOffersEvent extends Equatable {
  const JobOffersEvent();

  @override
  List<Object?> get props => [];
}

class JobOffersFetchEvent extends JobOffersEvent {}
