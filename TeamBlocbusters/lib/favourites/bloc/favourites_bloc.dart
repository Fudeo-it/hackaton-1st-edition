import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:favourites_repository/favourites_repository.dart';
import 'package:fudeo_hackaton/home/bloc/home_bloc.dart';
import 'package:job_offer_repository/job_offer_repository.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

typedef OpenJobOfferCallback = void Function(JobOffer);
typedef OpenFreelanceCallback = void Function(Freelance);

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  FavouritesBloc({
    required JobOfferRepository jobOfferRepository,
    required FavouritesRepository favouritesRepository,
    required OpenFreelanceCallback openFreelanceCallback,
    required OpenJobOfferCallback openJobOfferCallback,
  })  : _jobOfferRepository = jobOfferRepository,
        _favouritesRepository = favouritesRepository,
        _openFreelanceCallback = openFreelanceCallback,
        _openJobOfferCallback = openJobOfferCallback,
        super(
          const FavouritesState([], [], []),
        ) {
    on<JobOfferListChange>(_handleJobOfferListChange);
    on<FreelanceListChange>(_handleFreelanceListChange);
    on<FavouriteListChange>(_handleFavouritesChange);
    on<FavoriteTap>(_handleFavoriteTap);
    _jobOfferListSubscription = _jobOfferRepository.jobOfferList.listen((list) {
      add(JobOfferListChange(list));
    });
    _freelanceListSubscription =
        _jobOfferRepository.freelanceList.listen((list) {
      add(FreelanceListChange(list));
    });
    _favouritesListSubscription =
        _favouritesRepository.favourites.listen((list) {
      add(FavouriteListChange(list));
    });
  }

  final JobOfferRepository _jobOfferRepository;
  final FavouritesRepository _favouritesRepository;
  final OpenFreelanceCallback _openFreelanceCallback;
  final OpenJobOfferCallback _openJobOfferCallback;
  late StreamSubscription<List<JobOffer>> _jobOfferListSubscription;
  late StreamSubscription<List<Freelance>> _freelanceListSubscription;
  late StreamSubscription<List<String>> _favouritesListSubscription;

  void _handleFreelanceListChange(
    FreelanceListChange event,
    Emitter<FavouritesState> emit,
  ) {
    emit(
      FavouritesState(
        state.jobOfferList,
        event.freelanceList,
        state.favouriteList,
      ),
    );
  }

  void _handleJobOfferListChange(
    JobOfferListChange event,
    Emitter<FavouritesState> emit,
  ) {
    emit(
      FavouritesState(
        event.jobOfferList,
        state.freelanceList,
        state.favouriteList,
      ),
    );
  }

  void _handleFavouritesChange(
    FavouriteListChange event,
    Emitter<FavouritesState> emit,
  ) {
    emit(
      FavouritesState(
        state.jobOfferList,
        state.freelanceList,
        event.favouriteList,
      ),
    );
  }

  @override
  Future<void> close() {
    _jobOfferListSubscription.cancel();
    _freelanceListSubscription.cancel();
    _favouritesListSubscription.cancel();
    return super.close();
  }

  void _handleFavoriteTap(FavoriteTap event, Emitter<FavouritesState> emit) {
    final id = event.opportunity.id;
    final isJobOffer = state.jobOfferList.any((e) => e.id == id);
    if (isJobOffer) {
      _openJobOfferCallback(state.jobOfferList.firstWhere((e) => e.id == id));
    } else {
      _openFreelanceCallback(state.freelanceList.firstWhere((e) => e.id == id));
    }
  }
}
