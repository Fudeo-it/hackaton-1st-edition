import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/repositories/hiring_job_offer_repository.dart';

part 'hiring_job_offer_detail_screen_event.dart';
part 'hiring_job_offer_detail_screen_state.dart';
part 'hiring_job_offer_detail_screen_bloc.freezed.dart';

class HiringJobOfferDetailScreenBloc extends Bloc<HiringJobOfferDetailScreenEvent, HiringJobOfferDetailScreenState> {
  final HiringJobOfferRepository _hiringJobOfferRepository;
  late StreamSubscription<List<String>> _favoriteHiringJobOfferIdsSub;

  HiringJobOfferDetailScreenBloc({
    required HiringJobOfferRepository hiringJobOfferRepository,
    required HiringJobOffer hiringJobOffer,
  }) : _hiringJobOfferRepository = hiringJobOfferRepository, super(HiringJobOfferDetailScreenState(hiringJobOffer: hiringJobOffer)) {
    on<HiringJobOfferDetailScreenEvent>((event, emit) async {
      await event.when<Future>(
        initialized: () => _initialized(emit),
        favoriteHiringJobOfferToggled: () => _favoriteHiringJobOfferToggled(emit),
        favoriteHiringJobOffersChanged: (favoriteHiringJobOffersIds) => _favoriteHiringJobOffersChanged(favoriteHiringJobOffersIds, emit),
      );
    });

    _favoriteHiringJobOfferIdsSub = _hiringJobOfferRepository.favoriteHiringJobOfferIdsStream.listen((favoriteHiringJobOffersIds) {
      add(HiringJobOfferDetailScreenEvent.favoriteHiringJobOffersChanged(favoriteHiringJobOffersIds));
    });
  }

  @override
  Future<void> close() {
    _favoriteHiringJobOfferIdsSub.cancel();
    return super.close();
  }

  _initialized(Emitter<HiringJobOfferDetailScreenState> emit) async {
    List<String> favoriteHiringJobOfferIds = _hiringJobOfferRepository.getFavoriteHiringJobOfferIds();
    emit(state.copyWith(
      isFavorite: favoriteHiringJobOfferIds.contains(state.hiringJobOffer.id)
    ));
  }

  _favoriteHiringJobOfferToggled(Emitter<HiringJobOfferDetailScreenState> emit) async {
    _hiringJobOfferRepository.toggleFavoriteHiringJobOffer(state.hiringJobOffer.id);
  }

  _favoriteHiringJobOffersChanged(List<String> favoriteHiringJobOfferIds, Emitter<HiringJobOfferDetailScreenState> emit) async {
    emit(state.copyWith(
      isFavorite: favoriteHiringJobOfferIds.contains(state.hiringJobOffer.id)
    ));
  }
}
