import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';

part 'freelance_job_offer_detail_screen_event.dart';
part 'freelance_job_offer_detail_screen_state.dart';
part 'freelance_job_offer_detail_screen_bloc.freezed.dart';

class FreelanceJobOfferDetailScreenBloc extends Bloc<FreelanceJobOfferDetailScreenEvent, FreelanceJobOfferDetailScreenState> {
  final FreelanceJobOfferRepository _freelanceJobOfferRepository;
  late StreamSubscription<List<String>> _favoriteFreelanceJobOfferIdsSub;

  FreelanceJobOfferDetailScreenBloc({
    required FreelanceJobOfferRepository freelanceJobOfferRepository,
    required FreelanceJobOffer freelanceJobOffer,
  }) : _freelanceJobOfferRepository = freelanceJobOfferRepository, super(FreelanceJobOfferDetailScreenState(freelanceJobOffer: freelanceJobOffer)) {
    on<FreelanceJobOfferDetailScreenEvent>((event, emit) async {
      await event.when<Future>(
        initialized: () => _initialized(emit),
        favoriteFreelanceJobOfferToggled: () => _favoriteFreelanceJobOfferToggled(emit),
        favoriteFreelanceJobOffersChanged: (favoriteFreelanceJobOffersIds) => _favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds, emit),
      );
    });

    _favoriteFreelanceJobOfferIdsSub = _freelanceJobOfferRepository.favoriteFreelanceJobOfferIdsStream.listen((favoriteFreelanceJobOffersIds) {
      add(FreelanceJobOfferDetailScreenEvent.favoriteFreelanceJobOffersChanged(favoriteFreelanceJobOffersIds));
    });
  }

  @override
  Future<void> close() {
    _favoriteFreelanceJobOfferIdsSub.cancel();
    return super.close();
  }

  _initialized(Emitter<FreelanceJobOfferDetailScreenState> emit) async {
    List<String> favoriteFreelanceJobOfferIds = _freelanceJobOfferRepository.getFavoriteFreelanceJobOfferIds();
    emit(state.copyWith(
      isFavorite: favoriteFreelanceJobOfferIds.contains(state.freelanceJobOffer.id)
    ));
  }

  _favoriteFreelanceJobOfferToggled(Emitter<FreelanceJobOfferDetailScreenState> emit) async {
    _freelanceJobOfferRepository.toggleFavoriteFreelanceJobOffer(state.freelanceJobOffer.id);
  }

  _favoriteFreelanceJobOffersChanged(List<String> favoriteFreelanceJobOfferIds, Emitter<FreelanceJobOfferDetailScreenState> emit) async {
    emit(state.copyWith(
      isFavorite: favoriteFreelanceJobOfferIds.contains(state.freelanceJobOffer.id)
    ));
  }
}
