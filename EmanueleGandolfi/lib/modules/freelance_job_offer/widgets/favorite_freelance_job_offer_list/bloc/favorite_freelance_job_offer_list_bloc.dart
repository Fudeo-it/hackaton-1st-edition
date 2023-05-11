import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/helpers/loading_state.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';

part 'favorite_freelance_job_offer_list_event.dart';
part 'favorite_freelance_job_offer_list_state.dart';
part 'favorite_freelance_job_offer_list_bloc.freezed.dart';

class FavoriteFreelanceJobOfferListBloc extends Bloc<FavoriteFreelanceJobOfferListEvent, FavoriteFreelanceJobOfferListState> {
  final FreelanceJobOfferRepository _freelanceJobOfferRepository;
  late StreamSubscription<List<String>> _favoriteFreelanceJobOfferIdsSub;

  FavoriteFreelanceJobOfferListBloc({
    required FreelanceJobOfferRepository freelanceJobOfferRepository
  }) : _freelanceJobOfferRepository = freelanceJobOfferRepository, super(const FavoriteFreelanceJobOfferListState()) {
    on<FavoriteFreelanceJobOfferListEvent>((event, emit) async {
      await event.when<Future>(
        loadRequested: () => _loadRequested(emit),
        favoriteFreelanceJobOfferToggled: (freelanceJobOfferId) => _favoriteFreelanceJobOfferToggled(freelanceJobOfferId, emit),
        favoriteFreelanceJobOffersChanged: (favoriteFreelanceJobOffersIds) => _favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds, emit),
      );
    });

    _favoriteFreelanceJobOfferIdsSub = _freelanceJobOfferRepository.favoriteFreelanceJobOfferIdsStream.listen((favoriteFreelanceJobOffersIds) {
      add(FavoriteFreelanceJobOfferListEvent.favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds));
    });
  }

  @override
  Future<void> close() {
    _favoriteFreelanceJobOfferIdsSub.cancel();
    return super.close();
  }

  _loadRequested(Emitter<FavoriteFreelanceJobOfferListState> emit) async {
    try {
      emit(state.copyWith(
        loadingState: const LoadingState(
          status: LoadingStatus.inProgress,
        )
      ));

      List<FreelanceJobOffer> favoriteFreelanceJobOffers = await _freelanceJobOfferRepository.getFavoriteFreelanceJobOffers();

      emit(state.copyWith(
        loadingState: LoadingState(
          status: LoadingStatus.done,
          items: favoriteFreelanceJobOffers,
          error: null,
        ),
        favoriteFreelanceJobOfferIds: _freelanceJobOfferRepository.getFavoriteFreelanceJobOfferIds()
      ));
    } catch (err) {
      emit(state.copyWith(
        loadingState: LoadingState(
          status: LoadingStatus.error,
          error: err
        )
      ));
    }
  }

  _favoriteFreelanceJobOfferToggled(String freelanceJobOfferId, Emitter<FavoriteFreelanceJobOfferListState> emit) async {
    _freelanceJobOfferRepository.toggleFavoriteFreelanceJobOffer(freelanceJobOfferId);
  }

  _favoriteFreelanceJobOffersChanged(List<String> favoriteFreelanceJobOfferIds, Emitter<FavoriteFreelanceJobOfferListState> emit) async {
    emit(state.copyWith(
      favoriteFreelanceJobOfferIds: favoriteFreelanceJobOfferIds
    ));

    // We wait a little to avoid that the offers disappears immediately when the users tap the icon
    Future.delayed(const Duration(milliseconds: 500), () => add(const FavoriteFreelanceJobOfferListEvent.loadRequested()));
  }
}
