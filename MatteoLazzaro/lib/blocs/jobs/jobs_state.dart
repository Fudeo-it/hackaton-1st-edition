part of 'jobs_bloc.dart';

abstract class JobsState extends Equatable {
  const JobsState();

  @override
  List<Object?> get props => [];
}

class FetchingJobsState extends JobsState {}

class FetchedJobsState extends JobsState {
  final List<Job> jobs;

  const FetchedJobsState(this.jobs);

  @override
  List<Object?> get props => [jobs];
}

class NoJobsState extends JobsState {}

class ErrorJobsState extends JobsState {
  final String? errorMessage;

  const ErrorJobsState([this.errorMessage]);

  @override
  List<Object?> get props => [errorMessage];
}
