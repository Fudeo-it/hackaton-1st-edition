part of 'job_list_bloc.dart';

abstract class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}

class FetchingJobListState extends JobListState {
  const FetchingJobListState();
}

class FetchedJobListState extends JobListState {
  final List<Job> jobs;
  final bool hasMore;
  final Filters filters;
  final Sorts sorts;

  const FetchedJobListState({
    required this.jobs,
    required this.hasMore,
    required this.filters,
    required this.sorts,
  });

  @override
  List<Object> get props => [jobs];
}

class NoJobListState extends JobListState {
  const NoJobListState();
}

class ErrorJobListState extends JobListState {
  const ErrorJobListState();
}
