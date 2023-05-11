part of 'favourite_job_bloc.dart';

abstract class FavouriteJobEvent extends Equatable {
  const FavouriteJobEvent();

  @override
  List<Object> get props => [];
}

class AddFavouriteJobEvent extends FavouriteJobEvent {
  final FavouriteJob job;

  const AddFavouriteJobEvent(this.job);
}

class RemoveFavouriteJobEvent extends FavouriteJobEvent {
  final FavouriteJob job;

  const RemoveFavouriteJobEvent(this.job);
}
