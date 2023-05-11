import 'dart:async';
import 'package:annunci_lavoro_flutter/blocs/freelanceAds/bloc/freelance_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/repositories/ads_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourites_event.dart';
part 'favourites_state.dart';

class FavouritesBloc extends Bloc<FavouritesEvent, FavouritesState> {
  ///
  /// [Bloc] utilizzato per gestire le liste dei preferiti degli oggetti [JobPosition] e [FreelancePosition]
  /// ha come dipendenze [jobAdsBloc] e [freelanceAdsBloc] per accedere ei rispettiv controller delle liste.
  /// e [adsRepository] per scaricare gli annunci dalle api.
  ///
  final AdsRepository adsRepository;
  final JobAdsBloc jobAdsBloc;
  final FreelanceAdsBloc freelanceAdsBloc;
  FavouritesBloc({
    required this.adsRepository,
    required this.jobAdsBloc,
    required this.freelanceAdsBloc,
  }) : super(FavouritesInitial()) {
    on<FetchingFavouritesEvent>(_getAds);
  }

  /// metodo per inizializzare le liste con gli annunci aggiunti nei preferiti
  /// inizializza le liste nei controller dei bloc con gli annunci già presenti in memoria.
  /// scarica anche gli annunci non ancora restituiti con la paginazione tramite il repository [adsRepository]
  FutureOr<void> _getAds(
      FetchingFavouritesEvent event, Emitter<FavouritesState> emit) async {
    try {
      emit(FetchingFavState());
      //* passo le liste iniziali con gli annunci in memoria al repository.
      final favJobAds = await adsRepository
          .favouritesJobPositionsAds(jobAdsBloc.jobAdsController.favouriteList);
      final favfreelanceAds = await adsRepository.favouritesFreelanceAds(
          freelanceAdsBloc.freeLanceAdsController.adsList);
      //* aggiorno le liste con le liste ottenute dal repository che aggiunge gli eventuali annunci non ancora
      //* presenti in memoria.
      jobAdsBloc.jobAdsController.updateFovorites(favJobAds);
      freelanceAdsBloc.freeLanceAdsController.updateFovorites(favfreelanceAds);
      emit(FetchedFavState());
    } catch (error) {
      emit(ErrorFavState());
    }
  }

  /// meotdo che aggiunge l'evento [FetchingFavouritesEvent] al [Bloc]
  void getAds() => add(FetchingFavouritesEvent());
}
