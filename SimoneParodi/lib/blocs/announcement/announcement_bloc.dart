import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:offertelavoroflutter/cubits/favorite_mode_cubit.dart';
import 'package:offertelavoroflutter/errors/local_error.dart';
import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/announcement.dart';
import 'package:offertelavoroflutter/repositories/job_offer_repository.dart';
import 'package:offertelavoroflutter/services/utils.dart';

part 'announcement_event.dart';
part 'announcement_state.dart';

class AnnouncementBloc extends Bloc<AnnouncementEvent, AnnouncementState> {
  final JobOfferRepository jobOfferRepository;
  final FavoriteModeCubit favoriteModeCubit;
  final Logger logger;
  AnnouncementBloc({
    required this.jobOfferRepository,
    required this.logger,
    required this.favoriteModeCubit,
  }) : super(FetchingAnnouncementState()) {
    on<FetchAnnouncementEvent>(_onFetch);
    on<AddFavoriteAnnouncementEvent>(_toogleFavoriteAnnouncement);
  }

  FutureOr<void> _onFetch(
      FetchAnnouncementEvent event, Emitter<AnnouncementState> emit) async {
    emit(FetchingAnnouncementState());
    List<Announcement>? jobAnnouncements;
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        emit(
          const ErrorAnnouncementState(
            type: ErrorType.noConnectivity,
          ),
        );
        return;
      }
      if (event.fetchFavorite) {
        jobAnnouncements = await jobOfferRepository.favoriteAnnouncements();
      } else {
        jobAnnouncements = await jobOfferRepository.announcements();
      }
    } on NetworkError catch (e) {
      logger.e('${e.statusCode} ${e.reasonPhrase}');
      emit(
        const ErrorAnnouncementState(
          type: ErrorType.newtwork,
        ),
      );
    } on LocalError catch (e) {
      logger.e(e.errorMessage);
      emit(
        const ErrorAnnouncementState(
          type: ErrorType.local,
        ),
      );
    } on RepositoryError catch (e) {
      logger.e(e.errorMessage);
      emit(
        const ErrorAnnouncementState(
          type: ErrorType.repository,
        ),
      );
    }
    if (jobAnnouncements != null) {
      emit(
        jobAnnouncements.isEmpty
            ? NoAnnouncementState()
            : FetchedAnnouncementState(announcements: jobAnnouncements),
      );
    }
  }

  FutureOr<void> _toogleFavoriteAnnouncement(
      AddFavoriteAnnouncementEvent event, Emitter<AnnouncementState> emit) {
    if (state is FetchedAnnouncementState) {
      final jobOffers = (state as FetchedAnnouncementState).announcements;
      emit(FetchingAnnouncementState());
      final announcement =
          jobOffers.firstWhere((element) => element.id == event.id);
      if (announcement.favorite) {
        jobOfferRepository.localService.deleteFavouriteAnnouncement(
          id: event.id,
        );
        if (favoriteModeCubit.state) {
          jobOffers.removeWhere((element) => element.id == event.id);
        }
      } else {
        jobOfferRepository.localService.addFavouriteAnnouncement(
          id: event.id,
        );
      }
      if (!favoriteModeCubit.state) {
        final newAnnouncement = announcement.copyWith(
          favorite: !announcement.favorite,
        );
        final index = jobOffers.indexWhere((element) => element.id == event.id);
        jobOffers[index] = newAnnouncement;
      }
      emit(
        jobOffers.isEmpty
            ? NoAnnouncementState()
            : FetchedAnnouncementState(announcements: jobOffers),
      );
    }
  }

  void onFetch() {
    add(FetchAnnouncementEvent(
      fetchFavorite: favoriteModeCubit.state,
    ));
  }

  void toogleFavoriteAnnouncement({
    required String id,
  }) =>
      add(
        AddFavoriteAnnouncementEvent(id: id),
      );
}
