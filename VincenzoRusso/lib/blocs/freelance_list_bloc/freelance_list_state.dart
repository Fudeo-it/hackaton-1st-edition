part of 'freelance_list_bloc.dart';

abstract class FreelanceListState extends Equatable {
  const FreelanceListState();

  @override
  List<Object> get props => [];
}

class FetchingFreelanceListState extends FreelanceListState {
  const FetchingFreelanceListState();
}

class FetchedFreelanceListState extends FreelanceListState {
  final List<JobFreelance> freelanceJobs;
  final bool hasMore;
  final Filters filters;
  final Sorts sorts;

  const FetchedFreelanceListState({
    required this.freelanceJobs,
    required this.hasMore,
    required this.filters,
    required this.sorts,
  });
}

class NoFreelanceListState extends FreelanceListState {
  const NoFreelanceListState();
}

class ErrorFreelanceListState extends FreelanceListState {
  const ErrorFreelanceListState();
}
