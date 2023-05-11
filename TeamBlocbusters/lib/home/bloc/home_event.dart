part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeJobOffersChanged extends HomeEvent {
  const HomeJobOffersChanged(this.jobOffers);

  final List<JobOffer> jobOffers;

  @override
  List<Object> get props => [jobOffers];
}

class HomeFreelanceProjectsChanged extends HomeEvent {
  const HomeFreelanceProjectsChanged(this.freelanceProjects);

  final List<Freelance> freelanceProjects;

  @override
  List<Object> get props => [freelanceProjects];
}

class HomeOpportunityTap extends HomeEvent {
  const HomeOpportunityTap(this.opportunity);

  final Opportunity opportunity;

  @override
  List<Object> get props => [opportunity];
}
