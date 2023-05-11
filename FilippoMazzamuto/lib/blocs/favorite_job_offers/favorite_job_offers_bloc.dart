import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/services/local_storage_job_offers.dart';

part 'favorite_job_offers_event.dart';
part 'favorite_job_offers_state.dart';

class FavoriteJobOffersBloc extends Bloc<FavoriteJobOffersEvent, FavoriteJobOffersState> {
  final LocalStorageJobOffers localStorageJobOffers;
  
  FavoriteJobOffersBloc({
    required this.localStorageJobOffers
  }) : super(const FavoriteJobOffersState()) {
    on<FavoriteJobOfferFetching>(_onFetching);
    on<FavoriteJobOfferAdd>(_onAdd);
    on<ClearFavoritesList>(_onClear);
  }

  void _onFetching(FavoriteJobOfferFetching event, Emitter<FavoriteJobOffersState> emit) {
    emit(state.copyWith(
      status: FavoriteJobOffersStatus.success,
      jobOfferFavorites: localStorageJobOffers.getJobOffers(),
    ));
  }

  FutureOr<void>_onAdd(FavoriteJobOfferAdd event, Emitter<FavoriteJobOffersState> emit) async {
    emit(state.copyWith(
      status: FavoriteJobOffersStatus.loading,
    ));

    await localStorageJobOffers.saveJobOffer(event.jobOffer);
    
    emit(state.copyWith(
      status: FavoriteJobOffersStatus.success,
      jobOfferFavorites: localStorageJobOffers.getJobOffers(),
    ));
  }

  FutureOr<void>_onClear(ClearFavoritesList event, Emitter<FavoriteJobOffersState> emit) async {
    emit(state.copyWith(
      status: FavoriteJobOffersStatus.loading,
    ));

    await localStorageJobOffers.clearJobOffers();
    
    emit(state.copyWith(
      status: FavoriteJobOffersStatus.success,
      jobOfferFavorites: localStorageJobOffers.getJobOffers(),
    ));
  }
}