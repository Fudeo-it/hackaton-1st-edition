part of 'favorite_job_offers_bloc.dart';

abstract class FavoriteJobOffersEvent extends Equatable {
  const FavoriteJobOffersEvent();

  @override
  List<Object> get props => [];
}

class FavoriteJobOfferFetching extends FavoriteJobOffersEvent {}

class FavoriteJobOfferAdd extends FavoriteJobOffersEvent {
  final JobOffer jobOffer;

  const FavoriteJobOfferAdd({
    required this.jobOffer,
  });

  @override
  List<Object> get props => [jobOffer];
}

class ClearFavoritesList extends FavoriteJobOffersEvent {}