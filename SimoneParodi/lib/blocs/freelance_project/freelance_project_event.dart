part of 'freelance_project_bloc.dart';

abstract class FreelanceProjectEvent extends Equatable {
  const FreelanceProjectEvent();

  @override
  List<Object> get props => [];
}

class FetchFreelanceProjectEvent extends FreelanceProjectEvent {
  final bool fetchFavorite;

  const FetchFreelanceProjectEvent({
    required this.fetchFavorite,
  });

  @override
  List<Object> get props => [
        fetchFavorite,
      ];
}

class AddFavoriteFreelanceProjectEvent extends FreelanceProjectEvent {
  final String id;

  const AddFavoriteFreelanceProjectEvent({
    required this.id,
  });

  @override
  List<Object> get props => [
        id,
      ];
}
