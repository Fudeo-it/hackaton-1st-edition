import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:offertelavoroflutter/cubits/favorite_mode_cubit.dart';
import 'package:offertelavoroflutter/errors/local_error.dart';
import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';
import 'package:offertelavoroflutter/repositories/job_offer_repository.dart';
import 'package:offertelavoroflutter/services/utils.dart';

part 'freelance_project_event.dart';
part 'freelance_project_state.dart';

class FreelanceProjectBloc
    extends Bloc<FreelanceProjectEvent, FreelanceProjectState> {
  final JobOfferRepository jobOfferRepository;
  final Logger logger;
  final FavoriteModeCubit favoriteModeCubit;

  FreelanceProjectBloc({
    required this.favoriteModeCubit,
    required this.jobOfferRepository,
    required this.logger,
  }) : super(FetchingFreelanceProjectState()) {
    on<FetchFreelanceProjectEvent>(_onFetch);
    on<AddFavoriteFreelanceProjectEvent>(_toogleFavoriteFreelanceProject);
  }

  FutureOr<void> _onFetch(FetchFreelanceProjectEvent event,
      Emitter<FreelanceProjectState> emit) async {
    emit(FetchingFreelanceProjectState());

    List<FreelanceProject>? jobOffers;
    try {
      if (await Connectivity().checkConnectivity() == ConnectivityResult.none) {
        emit(
          const ErrorFreelanceProjectState(
            type: ErrorType.noConnectivity,
          ),
        );
        return;
      }
      if (event.fetchFavorite) {
        jobOffers = await jobOfferRepository.favoriteFreelanceProjects();
      } else {
        jobOffers = await jobOfferRepository.freelanceProjects();
      }
    } on NetworkError catch (e) {
      logger.e('${e.statusCode} ${e.reasonPhrase}');
      emit(
        const ErrorFreelanceProjectState(type: ErrorType.newtwork),
      );
    } on LocalError catch (e) {
      logger.e(e.errorMessage);
      emit(
        const ErrorFreelanceProjectState(type: ErrorType.local),
      );
    } on RepositoryError catch (e) {
      logger.e(e.errorMessage);
      emit(
        const ErrorFreelanceProjectState(type: ErrorType.repository),
      );
    }
    if (jobOffers != null) {
      emit(
        jobOffers.isEmpty
            ? NoFreelanceProjectState()
            : FetchedFreelanceProjectState(freelanceProjects: jobOffers),
      );
    }
  }

  FutureOr<void> _toogleFavoriteFreelanceProject(
      AddFavoriteFreelanceProjectEvent event,
      Emitter<FreelanceProjectState> emit) {
    if (state is FetchedFreelanceProjectState) {
      final jobOffers =
          (state as FetchedFreelanceProjectState).freelanceProjects;
      emit(FetchingFreelanceProjectState());
      final freelanceProject =
          jobOffers.firstWhere((element) => element.id == event.id);
      if (freelanceProject.favorite) {
        jobOfferRepository.localService.deleteFavouriteFreelanceProjects(
          id: event.id,
        );
        if (favoriteModeCubit.state) {
          jobOffers.removeWhere((element) => element.id == event.id);
        }
      } else {
        jobOfferRepository.localService.addFavouriteFreelanceProjects(
          id: event.id,
        );
      }
      if (!favoriteModeCubit.state) {
        final newFreelanceProject = freelanceProject.copyWith(
          favorite: !freelanceProject.favorite,
        );
        final index = jobOffers.indexWhere((element) => element.id == event.id);
        jobOffers[index] = newFreelanceProject;
      }

      emit(
        jobOffers.isEmpty
            ? NoFreelanceProjectState()
            : FetchedFreelanceProjectState(freelanceProjects: jobOffers),
      );
    }
  }

  void onFetch() {
    add(
      FetchFreelanceProjectEvent(
        fetchFavorite: favoriteModeCubit.state,
      ),
    );
  }

  void toogleFavoriteFreelanceProject({
    required String id,
  }) =>
      add(
        AddFavoriteFreelanceProjectEvent(id: id),
      );
}
