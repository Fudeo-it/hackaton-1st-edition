part of 'opportunity_list_bloc.dart';

@immutable
abstract class OpportunityListEvent extends Equatable {
  const OpportunityListEvent();

  @override
  List<Object> get props => [];
}

class JobOfferListChange extends OpportunityListEvent {
  const JobOfferListChange(this.jobOfferList);

  final List<JobOffer> jobOfferList;

  @override
  List<Object> get props => [jobOfferList];
}

class FreelanceListChange extends OpportunityListEvent {
  const FreelanceListChange(this.freelanceList);

  final List<Freelance> freelanceList;

  @override
  List<Object> get props => [freelanceList];
}

class JobOfferListTap extends OpportunityListEvent {
  const JobOfferListTap(this.jobOffer);

  final JobOffer jobOffer;

  @override
  List<Object> get props => [jobOffer];
}

class OpportunityToggleTap extends OpportunityListEvent {}

class SearchTextChanged extends OpportunityListEvent {
  const SearchTextChanged(this.searchText);

  final String searchText;

  @override
  List<Object> get props => [searchText];
}

class OpportunityFilterTap extends OpportunityListEvent {}

class FilterTap extends OpportunityListEvent {
  const FilterTap(this.filter);

  final Filter filter;

  @override
  List<Object> get props => [filter];
}

class CancelFilterTap extends OpportunityListEvent {}

class ApplyFilterTap extends OpportunityListEvent {}

class FilterChipTap extends OpportunityListEvent {
  const FilterChipTap(this.filter);

  final Filter filter;

  @override
  List<Object> get props => [filter];
}

class EmptyFilterTap extends OpportunityListEvent {}

class OpportunityTap extends OpportunityListEvent {
  const OpportunityTap(this.opportunity);

  final Opportunity opportunity;

  @override
  List<Object> get props => [opportunity];
}
