part of 'favourite_job_bloc.dart';

abstract class FavouriteJobState extends Equatable {
  const FavouriteJobState();

  @override
  List<Object> get props => [];
}

class LoadingFavouriteJobState extends FavouriteJobState {
  const LoadingFavouriteJobState();
}

class NoFavouriteJobState extends FavouriteJobState {
  const NoFavouriteJobState();
}

class LoadedFavouriteJobState extends FavouriteJobState {
  final List<FavouriteJob> favouriteJob;

  const LoadedFavouriteJobState(this.favouriteJob);
}

class ErrorFavouriteJobState extends FavouriteJobState {
  const ErrorFavouriteJobState();
}
