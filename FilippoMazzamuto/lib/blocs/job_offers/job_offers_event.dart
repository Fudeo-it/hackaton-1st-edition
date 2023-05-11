part of 'job_offers_bloc.dart';

abstract class JobOffersEvent extends Equatable {
  const JobOffersEvent();

  @override
  List<Object> get props => [];
}

class JobOffersSubscriptionRequested extends JobOffersEvent {
  const JobOffersSubscriptionRequested({
    required this.nameRequest,
  });

  final String nameRequest;
}

class RefreshRequested extends JobOffersEvent {
  const RefreshRequested();
}

class JobOffersSortFilterChanged extends JobOffersEvent {
  const JobOffersSortFilterChanged({
    required this.propertyFilter,
    required this.sortDirection,
  });

  final String propertyFilter;
  final Direction sortDirection;

  @override
  List<Object> get props => [propertyFilter, sortDirection];
}

class JobOffersFilterDeleted extends JobOffersEvent {
  const JobOffersFilterDeleted({
    required this.filter,
  });

  final dynamic filter;

  @override
  List<Object> get props => [filter];
}

class JobOffersFilterChanged extends JobOffersEvent {
  final List<String> values;
  final String field;

  const JobOffersFilterChanged({
    required this.values,
    required this.field,
  });

  @override
  List<Object> get props => [values, field];
}


class JobOffersClearAllFilters extends JobOffersEvent {
  const JobOffersClearAllFilters();
}