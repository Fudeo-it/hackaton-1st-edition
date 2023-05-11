part of 'freelance_project_bloc.dart';

abstract class FreelanceProjectState extends Equatable {
  const FreelanceProjectState();

  @override
  List<Object> get props => [];
}

class FetchingFreelanceProjectState extends FreelanceProjectState {}

class FetchedFreelanceProjectState extends FreelanceProjectState {
  final List<FreelanceProject> freelanceProjects;

  const FetchedFreelanceProjectState({
    required this.freelanceProjects,
  });

  @override
  List<Object> get props => [
        freelanceProjects,
      ];
}

class NoFreelanceProjectState extends FreelanceProjectState {}

class ErrorFreelanceProjectState extends FreelanceProjectState {
  final ErrorType type;

  const ErrorFreelanceProjectState({
    required this.type,
  });

  @override
  List<Object> get props => [
        type,
      ];
}
