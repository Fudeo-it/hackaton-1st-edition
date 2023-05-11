part of 'job_projects_bloc.dart';

abstract class JobProjectsEvent extends Equatable {
  const JobProjectsEvent();

  @override
  List<Object> get props => [];
}

class JobProjectsFetchEvent extends JobProjectsEvent {}
