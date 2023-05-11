part of 'freelance_list_bloc.dart';

abstract class FreelanceListEvent extends Equatable {
  const FreelanceListEvent();

  @override
  List<Object> get props => [];
}

class FetchFreelanceListEvent extends FreelanceListEvent {
  final Filters? filters;
  final Sorts? sorts;

  const FetchFreelanceListEvent({
    this.filters,
    this.sorts,
  });
}

class FetchMoreFreelanceListEvent extends FreelanceListEvent {
  const FetchMoreFreelanceListEvent();
}
