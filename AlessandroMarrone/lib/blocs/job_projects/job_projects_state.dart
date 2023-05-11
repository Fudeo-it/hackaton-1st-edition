part of 'job_projects_bloc.dart';

abstract class JobProjectsState extends Equatable {
  const JobProjectsState();

  @override
  List<Object?> get props => [];
}

class JobProjectsFetching extends JobProjectsState {}

class JobProjectsFetched extends JobProjectsState {
  final List<JobProjectModel> jobs;

  const JobProjectsFetched({
    required this.jobs,
  });

  @override
  List<Object?> get props => [jobs];
}

class NoJobProjectsFetched extends JobProjectsState {}

class JobProjectsError extends JobProjectsState {
  final String? errorMessage;

  const JobProjectsError({
    this.errorMessage,
  });

  @override
  List<Object?> get props => [errorMessage];
}
