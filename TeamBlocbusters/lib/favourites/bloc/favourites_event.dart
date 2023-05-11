part of 'favourites_bloc.dart';

abstract class FavouritesEvent extends Equatable {
  const FavouritesEvent();

  @override
  List<Object> get props => [];
}

class JobOfferListChange extends FavouritesEvent {
  const JobOfferListChange(this.jobOfferList);

  final List<JobOffer> jobOfferList;

  @override
  List<Object> get props => [jobOfferList];
}

class FreelanceListChange extends FavouritesEvent {
  const FreelanceListChange(this.freelanceList);

  final List<Freelance> freelanceList;

  @override
  List<Object> get props => [freelanceList];
}

class FavouriteListChange extends FavouritesEvent {
  const FavouriteListChange(this.favouriteList);

  final List<String> favouriteList;

  @override
  List<Object> get props => [favouriteList];
}

class FavoriteTap extends FavouritesEvent {
  const FavoriteTap(this.opportunity);

  final Opportunity opportunity;

  @override
  List<Object> get props => [opportunity];
}
