import 'dart:async';

import 'package:annunci_lavoro_flutter/errors/repository_error.dart';
import 'package:annunci_lavoro_flutter/misc/freelance_ads_controller.dart';
import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:annunci_lavoro_flutter/repositories/ads_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'freelance_ads_event.dart';
part 'freelance_ads_state.dart';

class FreelanceAdsBloc extends Bloc<FreelanceAdsEvent, FreelanceAdsState> {
  ///
  /// [Bloc] che gestisce gli annunci di tipo [FreeLancePosition].
  ///
  /// ha come dipendenze [adsRepository] per accedere al layer Repository e scaricare i dati dalle API.
  ///
  /// ed inizializza [freeLanceAdsController] come controller per gesrire la lista di  annunci [FreeLancePosition].
  ///
  final AdsRepository adsRepository;
  final FreeLanceAdsController freeLanceAdsController =
      FreeLanceAdsController([]);

  FreelanceAdsBloc({required this.adsRepository})
      : super(FreelanceAdsInitial()) {
    on<FetchInitialFreelanceAdsEvent>(_fetchInitialData);
    on<FetchMoreFreelanceAdsEvent>(_moreAds);
  }

  /// metodo che scarica i primi dati dalle API  ed inizializza il controller [freeLanceAdsController] con i primi dati.
  FutureOr<void> _fetchInitialData(FetchInitialFreelanceAdsEvent event,
      Emitter<FreelanceAdsState> emit) async {
    emit(InitfreelanceAdsState());
    try {
      final freelanceAds = await adsRepository.freeLancePositions();
      _addItems(freelanceAds);
      emit(FetchedFreelanceAdsState());
    } on RepositoryError catch (error) {
      emit(ErrorFreelanceAdsState(error.errorMessage));
    } catch (error) {
      emit(const ErrorFreelanceAdsState());
    }
  }

  /// metodo che scarica altri annnci di tipo [FreeLancePosition] e gli aggiunge al flusso dati  di [freeLanceAdsController]
  FutureOr<void> _moreAds(
      FetchMoreFreelanceAdsEvent event, Emitter<FreelanceAdsState> emit) async {
    try {
      if (adsRepository.hasMoreFreelanceAds == false) {
        emit(NoMoreFreelanceAdsState());
        return;
      }
      emit(FetchingMoreFreelanceAdsState());
      final freelanceAds = await adsRepository.freeLancePositions();
      _addItems(freelanceAds);
      emit(InitfreelanceAdsState());
    } on RepositoryError catch (error) {
      emit(ErrorFreelanceAdsState(error.errorMessage));
    } catch (error) {
      emit(const ErrorFreelanceAdsState());
    }
  }

  /// metodo per aggiungere oggetti [FreeLancePosition] al controller [freeLanceAdsController]
  void _addItems(List<FreeLancePosition> items) {
    freeLanceAdsController.addItems(items);
  }

  /// metodo che aggiunge l'evento [FetchInitialFreelanceAdsEvent] al [Bloc]
  void fetchAds() => add(FetchInitialFreelanceAdsEvent());

  /// metodo che aggiunge l'evento [FetchMoreFreelanceAdsEvent] al [Bloc]
  void moreAds() => add(FetchMoreFreelanceAdsEvent());
}
