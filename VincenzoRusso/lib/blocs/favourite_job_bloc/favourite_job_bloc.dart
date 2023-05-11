import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:offertelavoroflutter_app/models/enum/job_type.dart';
import 'package:offertelavoroflutter_app/models/favourite_job.dart';
import 'package:offertelavoroflutter_app/repositories/favourite_repository.dart';

part 'favourite_job_event.dart';
part 'favourite_job_state.dart';

class FavouriteJobBloc
    extends HydratedBloc<FavouriteJobEvent, FavouriteJobState> {
  static const _favouriteJobKey = "favourite_job";
  static const _idKey = "id";
  static const _companyKey = "company";
  static const _positionKey = "position";
  static const _emojiKey = "emoji";
  static const _jobTypeKey = "job_type";

  final FavouriteRepository favouriteRepository;

  FavouriteJobBloc(this.favouriteRepository)
      : super(const NoFavouriteJobState()) {
    on<AddFavouriteJobEvent>(_onAddFavouriteJobEvent);
    on<RemoveFavouriteJobEvent>(_onRemoveFavouriteJobEvent);
  }

  @override
  FavouriteJobState? fromJson(Map<String, dynamic> json) {
    if (json[_favouriteJobKey].length != 0) {
      final favouriteJob = (json[_favouriteJobKey] as List)
          .map(
            (jsonJob) => FavouriteJob(
              id: jsonJob[_idKey],
              company: jsonJob[_companyKey],
              position: jsonJob[_positionKey],
              emoji: jsonJob[_emojiKey],
              jobType: JobType.values.firstWhere(
                (element) => element.name == jsonJob[_jobTypeKey],
              ),
            ),
          )
          .toList(growable: false);

      favouriteRepository.setFavourites(List.from(favouriteJob));

      return LoadedFavouriteJobState(favouriteJob);
    }

    return const NoFavouriteJobState();
  }

  @override
  Map<String, dynamic>? toJson(FavouriteJobState state) {
    if (state is LoadedFavouriteJobState) {
      return {
        _favouriteJobKey: state.favouriteJob
            .map((job) => {
                  _idKey: job.id,
                  _companyKey: job.company,
                  _positionKey: job.position,
                  _emojiKey: job.emoji,
                  _jobTypeKey: job.jobType.name,
                })
            .toList(growable: false),
      };
    }

    return {
      _favouriteJobKey: [],
    };
  }

  void addFavourite(FavouriteJob job) => add(AddFavouriteJobEvent(job));

  void removeFavourite(FavouriteJob job) => add(RemoveFavouriteJobEvent(job));

  FutureOr<void> _onAddFavouriteJobEvent(
      AddFavouriteJobEvent event, Emitter<FavouriteJobState> emit) {
    emit(const LoadingFavouriteJobState());

    final favouriteJob = favouriteRepository.addFavourite(event.job);

    emit(
      favouriteJob.isNotEmpty
          ? LoadedFavouriteJobState(favouriteJob)
          : const NoFavouriteJobState(),
    );
  }

  FutureOr<void> _onRemoveFavouriteJobEvent(
      RemoveFavouriteJobEvent event, Emitter<FavouriteJobState> emit) {
    emit(const LoadingFavouriteJobState());

    final favouriteJob = favouriteRepository.removeFavourite(event.job);

    emit(
      favouriteJob.isNotEmpty
          ? LoadedFavouriteJobState(favouriteJob)
          : const NoFavouriteJobState(),
    );
  }
}
