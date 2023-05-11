import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/helpers/loading_state.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/repositories/hiring_job_offer_repository.dart';

part 'favorite_hiring_job_offer_list_event.dart';
part 'favorite_hiring_job_offer_list_state.dart';
part 'favorite_hiring_job_offer_list_bloc.freezed.dart';

class FavoriteHiringJobOfferListBloc extends Bloc<FavoriteHiringJobOfferListEvent, FavoriteHiringJobOfferListState> {
  final HiringJobOfferRepository _hiringJobOfferRepository;
  late StreamSubscription<List<String>> _favoriteHiringJobOfferIdsSub;

  FavoriteHiringJobOfferListBloc({
    required HiringJobOfferRepository hiringJobOfferRepository
  }) : _hiringJobOfferRepository = hiringJobOfferRepository, super(const FavoriteHiringJobOfferListState()) {
    on<FavoriteHiringJobOfferListEvent>((event, emit) async {
      await event.when<Future>(
        loadRequested: () => _loadRequested(emit),
        favoriteHiringJobOfferToggled: (hiringJobOfferId) => _favoriteHiringJobOfferToggled(hiringJobOfferId, emit),
        favoriteHiringJobOffersChanged: (favoriteHiringJobOffersIds) => _favoriteHiringJobOffersChanged(favoriteHiringJobOffersIds, emit),
      );
    });

    _favoriteHiringJobOfferIdsSub = _hiringJobOfferRepository.favoriteHiringJobOfferIdsStream.listen((favoriteHiringJobOffersIds) {
      add(FavoriteHiringJobOfferListEvent.favoriteHiringJobOffersChanged(favoriteHiringJobOffersIds));
    });
  }

  @override
  Future<void> close() {
    _favoriteHiringJobOfferIdsSub.cancel();
    return super.close();
  }

  _loadRequested(Emitter<FavoriteHiringJobOfferListState> emit) async {
    try {
      emit(state.copyWith(
        loadingState: const LoadingState(
          status: LoadingStatus.inProgress,
        )
      ));

      List<HiringJobOffer> favoriteHiringJobOffers = await _hiringJobOfferRepository.getFavoriteHiringJobOffers();

      emit(state.copyWith(
        loadingState: LoadingState(
          status: LoadingStatus.done,
          items: favoriteHiringJobOffers,
          error: null,
        ),
        favoriteHiringJobOfferIds: _hiringJobOfferRepository.getFavoriteHiringJobOfferIds()
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

  _favoriteHiringJobOfferToggled(String hiringJobOfferId, Emitter<FavoriteHiringJobOfferListState> emit) async {
    _hiringJobOfferRepository.toggleFavoriteHiringJobOffer(hiringJobOfferId);
  }

  _favoriteHiringJobOffersChanged(List<String> favoriteHiringJobOfferIds, Emitter<FavoriteHiringJobOfferListState> emit) async {
    emit(state.copyWith(
      favoriteHiringJobOfferIds: favoriteHiringJobOfferIds
    ));

    // We wait a little to avoid that the offers disappears immediately when the users tap the icon
    Future.delayed(const Duration(milliseconds: 500), () => add(const FavoriteHiringJobOfferListEvent.loadRequested()));
  }
}
