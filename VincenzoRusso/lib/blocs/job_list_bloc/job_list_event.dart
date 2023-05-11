part of 'job_list_bloc.dart';

abstract class JobListEvent extends Equatable {
  const JobListEvent();

  @override
  List<Object> get props => [];
}

class FetchJobListEvent extends JobListEvent {
  final Filters? filters;
  final Sorts? sorts;

  const FetchJobListEvent({
    this.filters,
    this.sorts,
  });
}

class FetchMoreJobListEvent extends JobListEvent {
  const FetchMoreJobListEvent();
}
