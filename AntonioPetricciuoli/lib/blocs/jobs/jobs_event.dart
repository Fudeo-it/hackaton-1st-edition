part of 'jobs_bloc.dart';

class JobsEvent extends Equatable {
  const JobsEvent();

  @override
  List<Object> get props => [];
}

class JobsGet extends JobsEvent {
  const JobsGet({this.filters = const Filters()});

  final Filters filters;

  @override
  List<Object> get props => [filters];
}

class JobSave extends JobsEvent {
  const JobSave({required this.id});

  final String id;

  @override
  List<Object> get props => [id];
}
